# Learning dplyr
#install and load the dplyr package
#only need to install this once, so do it now then comment it out
# install.packages('dplyr')
#tell R we want to use the dplyr library
library(dplyr)
library(ggplot2)
#import data
gapminder<-read.csv(file='data-shell/data-shell/gapminder_data.csv')

#look at the first 6 lines of the data
head(gapminder)

#select function
#select is used to choose specific columns
#a pipe in dplyr is %>%
gap_yr_gdp<-gapminder %>% select(year,gdpPercap)
head(gap_yr_gdp)

#filter function
#filter is used to choose specific rows
gap_1960s<-gapminder %>% filter(year>=1960 & year<1970)
head(gap_1960s)

#using multiple dplyr functions together
gap_yr_gdp_1960s <- gapminder %>% 
  select(year,gdpPercap) %>%
  filter(year >= 1960 & year < 1970)
head(gap_yr_gdp_1960s)

#Challenge: Life Exp, country and year for only Africa
#note: do the filter before select or will eliminate the
#variable continent too early
gap_Afr <-gapminder %>%
  filter(continent == "Africa") %>%
  select(country,year, lifeExp)
head(gap_Afr)
nrow(gap_Afr)
str(gap_Afr)

#summarizing data
#getting min, max, SD, etc
#look for mean gdp for each continent
gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))
gdp_by_continent

#now add a SD
gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap), sd_gdp = sd(gdpPercap))
gdp_by_continent

#add another each year and each continent
gdp_by_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdp = mean(gdpPercap), sd_gdp = sd(gdpPercap))
gdp_by_continent

#mutate function
#add new columns that are functions of the other columns
#calculate total gdp as pop*gcpPercap*1M
gdp_pop<-gapminder %>%
  mutate(gdp_billions = (gdpPercap*pop)/10^9)
head(gdp_pop)

#string with ggplot to plot mean gdp vs. year by continent
gapminder %>%
  mutate(gdp_billions = (gdpPercap*pop)/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdp_bill = mean(gdp_billions)) %>%
  ggplot(aes(x=year,y=mean_gdp_bill,color=continent)) + geom_point()
