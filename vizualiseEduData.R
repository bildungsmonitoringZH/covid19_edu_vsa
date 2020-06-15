# vizualise data from monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 15.06.2020
###############################################################################

getData <- function(url = 'https://raw.githubusercontent.com/statistikZH/covid19monitoring/master/covid19socialmonitoring.csv')
{
    data_full <- read.csv(url)
    
    nm_select <- levels(data_full$variable_short) %>% str_subset(pattern = 'training')
    data_select <- data_full %>%
        filter(.data$variable_short %in% nm_select)
    
    data_add <- read.csv('https://github.com/bildungsmonitoringZH/covid19_edu_vsa/raw/master/Bildung_WikiFernlernen.csv', as.is = TRUE) %>%
        mutate_at('variable_short', ~factor(.x, levels = levels(data_full$variable_short)))
    
    data <- data_select %>%
        bind_rows(data_add) %>%
        mutate_at('date', ~as.POSIXct(.data$date))
}

visualizeData <- function()
{
    data <- getData() %>%
        group_by(.data$variable_short) %>%
        mutate('value_z' := scale(.data$value)) %>%
        ungroup

    plot <- ggplot(data, aes(x = date, y = value_z, group = variable_short, colour = variable_short)) +
        geom_line()
}
