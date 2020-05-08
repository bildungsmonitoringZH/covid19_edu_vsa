# prepare Wiki VSA data for monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 8.05.2020
###############################################################################

readMeta <- function(file = 'data/wiki_meta.json')
{
    meta <- jsonlite::read_json(file) %>%
        purrr::imap_dfc(~tibble('tmp' := 1, !!.y := as.character(.x)) %>% select(-.data$tmp))
}

loadSingleFile <- function(file)
{
    # parse argument
    assert_that(is.string(file))
    assert_that(file.exists(file))
    
    # get sheet names and dates
    data_nm <- openxlsx::getSheetNames(file = file)
    data_toc <- lubridate::dmy(str_c('1', data_nm, sep = '. '), quiet = TRUE) %>%
        purrr::set_names(data_nm) %>%
        na.omit()
    
    data_raw <- purrr::imap(data_toc, ~openxlsx::read.xlsx(xlsxFile = file, sheet = .y, startRow = 5) %>%
                                mutate('date_first' := .x))
    ctrl_names <- map(data_raw, ~names(.x))
    assert_that(all(map_lgl(ctrl_names[-1], ~identical(ctrl_names[[1]], .x))))

    data_t <- purrr::map_dfr(data_raw, ~.x) %>%
        transmute('date_first' := .data$date_first,
                  'date' := str_c(.data$Day, month(.data$date_first), year(.data$date_first), 0, 0, 0, sep = '.') %>%
                      lubridate::dmy_hms() %>%
                      as.POSIXct(),
                  'date_last' := max(.data$date),
                  'value' := as.integer(round(.data$Visits)))
    return(data_t)
}

getData <- function(directory = 'data')
{
    # parse argument
    assert_that(is.string(directory))
    assert_that(is.dir(directory))
    
    
    
    # get all files
    files <- list.files(path = directory, pattern = '^wiki_\\d{6}.xlsx$', full.names = TRUE) %>%
        sort(decreasing = TRUE)
    
    # get data from files
    data_raw <- purrr::map_dfr(files, ~loadSingleFile(file = .x))
    
    # get meta and specs
    meta <- readMeta()
    
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))

    # format data
    data_t <- data_raw %>%
        arrange(.data$date, .data$date_last) %>%
        group_by(.data$date) %>%
        summarise('value' := tail(.data$value, 1)) %>%
        ungroup %>%
        mutate('variable_short' := head(meta$variable_short, 1))
    
    assert_that(identical(nrow(data_t), length(unique(data_raw$date))))
   
    # generate output data, return
    data_out <- data_t %>%
        left_join(meta, by = 'variable_short') %>%
        select(df_spec$name)
    
    return(data_out)
}

testTable <- function(df)
{
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    assert_that(is(df, 'data.frame'))
    assert_that(identical(names(df), df_spec$name))
    
    purrr::pwalk(as.list(df_spec), ~assert_that(is(get(.x, df), .y), msg = sprintf('df$%s is not of class %s.', .x, .y)))
    
    df_t <- df %>% select_if(is.character) %>%
        mutate_all(fct_inorder)
    
    meta_count <- readMeta() %>% as.list() %>% purrr::map_int(~length(unique(.x)))
    
    assert_that(identical(names(df_t), names(meta_count)))
    assert_that(identical(meta_count,
                          purrr::map_int(as.list(df_t), ~nlevels(.x))))
    
    return(invisible(NULL))
}

saveData <- function(flag)
{
    assert_that(is.flag(save_data))
    assert_that(noNA(save_data))

    if( flag ) 
        {
        data_prep <- getData() %>% 
            filter(!is.na(.data$topic))
        test <- testTable(data_prep)
        save_data <- TRUE
        write.table(data_prep, "./Bildung_WikiFernlernen.csv", sep=",", fileEncoding="UTF-8", row.names = F)
    }
}

visualiseData <- function(...)
{
    data <- getData()
    
    plot <- ggplot(data, aes(x = date, y = value)) +
        geom_line(size = biplaR::geom_args$line$size, colour = biplaR::getColourZH(1)) +
        biplaR::getTheme()
}

# main
if( !exists('save_data') ) save_data <- TRUE
saveData(save_data)
