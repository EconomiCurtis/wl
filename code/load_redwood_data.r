# Curtis Kephart
# just a file to help understand how to load redwood3 data. 

# load libraries
library(readr)
library(dplyr)
library(ggplot2)

wldata <- read_csv("~/Dropbox/SSEL/Wl/data/example_data/Bubbles Weakest Link-2017-06-23 05-22-57.181343.csv") %>%
  dplyr::mutate(
    Key = as.factor(Key)
  )

# types of messages saved
table(wldata$Key)
#state is saved on each tick, and logs anything we want it to log, action, payoff, etc 

wldata = redwoodParser(wldata, 'state')

ggplot(
  data = wldata %>% dplyr::filter(Key == "state"),
  aes(
    x = ClientTime
  )
) + 
  geom_histogram(bins = 250)

ggplot(
  data = wldata %>%
    dplyr::filter(Key == 'state') %>%
    group_by(Period, Group) %>%
    dplyr::mutate(
      PeriodTime = Time - min(Time)
    ),
  aes(
    x = PeriodTime,
    y = state.action,
    colour = as.factor(state.subjectid)
  )
) +
  geom_line() +
  facet_grid(Period~.) +
  labs(
    title = "Actions"
  )


ggplot(
  data = wldata %>%
    dplyr::filter(Key == 'state') %>%
    group_by(Period, Group) %>%
    dplyr::mutate(
      PeriodTime = Time - min(Time)
    ),
  aes(
    x = PeriodTime,
    y = state.payoff,
    colour = as.factor(state.subjectid)
  )
) +
  geom_line() +
  facet_grid(Period~.) +
  labs(
    title = "Payoffs"
  )

