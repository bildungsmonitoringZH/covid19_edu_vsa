---
pagetitle: Monitoring Covid19 im Bildungsbereich
---

![](https://github.com/bildungsmonitoringZH/bildungsmonitoringZH.github.io/raw/master/assets/ktzh_bi_logo_de-300x88.jpg)

# Monitoring Covid19 im Bildungsbereich

Flavian Imlig, <flavian.imlig@bi.zh.ch>
Maja Stoll, <maja.stoll@bi.zh.ch>

## Ziel

Das Ziel des Monitorings Covid19 im Bildungsbereich durch die Bildungsdirektion des Kantons Zürich ist eine konsistente und valide Datengrundlage zu den Covid19-Fällen und den Personen in Quarantäne. Diese Datengrundlage soll alle öffentlichen Schulen von Kindergarten bis Sekundarstufe II im Kanton Zürich abdecken.

## Verantworung und Zuständigkeiten

Gesamtverwantwortung: Oliver Shammas
Verantwortliche VSA: Yvonne Kind
Verantwortliche MBA: --
Verantwortliche BP: Sybille Bayard

Beteiligte: 

## Daten

Die im Monitoring Covid19 im Bildungsbereich erhobenen Daten stellen einen Zusammenzug der Daten der einzelnen Schulen bzw. Schuleinheiten dar. 

### Datenlieferanten

- Schulleitungen der Volkssschulen
- Schulleitungen der Mittel- und Berufsfachschulen

## Datenverarbeitung

Volksschulamt (VSA), Mittelschul- und Berufsbildungsamt (MBA), Bildungsplanung (BP)

## Ansprechpersonen

- für Volksschulen: VSA, abc, abc@bi.zh.ch
- für Mittel- und Berufsschulen: MBA, dev, def@bi.zh.ch

## Datenstruktur

| Feldname          | Feldname technisch | Beschreibung | Format  | Bemerkungen |
|-------------------|--------------------|--------------|---------|-------------|
| __Schulcode__ | `school_code` | fünfstelliger Code der Bildungsstatistik für die Schuleinheit | Nummer | siehe [Liste der Schulen](#) |
| __Schulname__ | `school_name` | Name/Bezeichnung der Schuleinheit | Text | siehe [Liste der Schulen](#) |
| __E-Mail-Adresse(n)__ | `email` | E-Mail-Adresse der Person, die die Daten einträgt (Meldeperson) | E-Mail | mehrere E-Mail-Adressen mit Komma trennen |
| __Datum__ | `date` | Datum der Meldung | DD-MM-YYYY | |
| __Rolle__ | `role` | Personengruppe, Rolle der betroffenen Personen | ein Wert gemäss [Liste](#feld-rolle) | | 
| __Stufe__ | `level` | Stufe der betroffenen Personen | ein Wert gemäss [Liste](#feld-stufe) | |
| __bestätigte Fälle kumuliert__ | `ncumul_conf` | kumulierte Anzahl der bestätigten Fälle | Ganzzahl | kumuliert seit Beginn des Schuljahres 2020/21 |
| __bestätigte Fälle neu__ | `nnew_conf` | Anzahl neuer bestätigter Fälle | Ganzzahl | |
| __in Quarantäne aktuell__ | `ncurr_quarantined` | Anzahl Personen, die sich aktuell in Quarantäne befinden | Ganzzahl | |
| __in Quarantäne neu__ | `nnew_quarantined` | Anzahl Personen, die sich neu in Quarantäne befinden | Ganzzahl | |
| __Bemerkungen__ | `comments` | Bemerkungen zum Eintrag | Text | |

### Feld __Rolle__

| Wert | Label | Bemerkungen |
|------|-------|-------------|
| SuS | Schülerinnen, Schüler, Lernende | |
| LP | Lehrpersonen | |
| FP | Fachpersonen und weiteres Personal | |

Personen, die unter mehreren Anstellungen mindestens eine als Lehrperson haben, werden den Lehrpersonen zugeordnet. Als Fachpersonen und weiteres Personal werden nur Personen betrachtet, die gar keine Lehrpersonenfunktion haben.

### Feld __Stufe__

| wert | Label | Bemerkungen |
|------|-------|-------------|
| KG | Kindergarten | Primarstufe 1-2 |
| P | Primarschule | Primarstufe 3-8 |
| Sek I | Sekundarschule | |
| Sek II | Sekundarstufe II | inkl. Langgymnasium und HMS |

### Leitsätze zum Eintragen der Daten

- Pro Schule bzw. Schuleinheit wird ein [Meldeformular](#) geführt.

- Die Felder __Schulcode__, __Schulname__, __E-Mail-Adresse(n)__, __Datum__, __Rolle__ und __Stufe__ sind Pflichtfelder. Sie müssen immer mit einen Wert enthalten.

- Die Felder __bestätigte Fälle kumuliert__, __bestätigte Fälle neu__, __in Quarantäne aktuell__ und __in Quarantäne neu__ sind die Felder für die Fall- und Quarantänezahlen. Hier ist es zentral, dass nur Werte eingetragen werden, die mit der Felddefinition übereinstimmen. Es müssen nicht alle vier Felder ausgefüllt sein, sondern nur jene für die es Daten gibt.

- Das Feld __Bemerkungen__ dient der Ablage von Zusatzinformationen. Es muss nur bei Bedarf ausgefüllt werden. In diesem Feld können bespielsweise Hinweise auf bekannte Ansteckungsorte oder auf Quarantänegründe gemacht werden.

- Im [Meldeformular](#) werden Zeilen hinzugefügt und bei Bedarf angepasst. Im Formular werden Daten nur in absoluten Ausnahmefällen und in Absprache mit der zuständigen [Ansprechperson](#ansprechpersonen) gelöscht.

## Erfassungsprozess (Variante A)

### beim ersten Fall in einer Schule

1. Die Schulleitung bestimmt eine Person, die verantwortlich ist für die Meldung (Meldeperson)

2. Die Meldeperson lädt das [Meldeformular](#) herunter.

3. Die Meldeperson trägt im Tabellenblatt "Schule" __Schulcode__, __Schulname__ sowie __E-Mail-Adresse(n)__ ein. Eine Liste der Schulen inkl. Codes ist [hier](#) zu finden.

4. Die Meldeperson trägt die Angaben zu den Covid19-Fällen und/oder den Personen in Quarantäne im Tabellenblatt "Daten" ein (Felder: __Datum__, __Rolle__, __Stufe__, __bestätigte Fälle kumuliert__, __bestätigte Fälle neu__, __in Quarantäne aktuell__, __in Quarantäne neu__ und __Bemerkungen__ ).

5. Die Meldeperson speichert das Formular ab und schickt es via E-Mail an die zuständige [Ansprechperson](#ansprechpersonen).

6. Die Meldeperson erhält, in der Regel innert drei Tagen, eine Rückmeldung von der [Ansprechperson](#ansprechpersonen). Bei Änderungen schickt die [Ansprechperson](#ansprechpersonen) eine korrigierte Version des Formulars an die Meldeperson zurück.

7. Die Meldeperson stellt sicher, dass sie die aktuellste Version des Formulars zur Verwendung bei weiteren Fällen abgespeichert hat.

### bei weiteren Fällen

1. Die Meldeperson ergänzt die Angaben zu den Covid19-Fällen und/oder den Personen in Quarantäne im Tabellenblatt "Daten" ein. Dazu fügt sie nach Bedarf weitere Zeilen hinzu. Die bestehenden Daten sollen nur in begründeten Ausnahmefällen geändert und auf keinen Fall überschrieben werden.

2. Die Meldeperson speichert das Formular ab und schickt es via E-Mail an die zuständige [Ansprechperson](#ansprechpersonen).

3. Die Meldeperson erhält, in der Regel innert drei Tagen, eine Rückmeldung von der [Ansprechperson](#ansprechpersonen). Bei Änderungen schickt die [Ansprechperson](#ansprechpersonen) eine korrigierte Version des Formulars an die Meldeperson zurück.

4. Die Meldeperson stellt sicher, dass sie die aktuellste Version des Formulars zur Verwendung bei weiteren Fällen abgespeichert hat.
