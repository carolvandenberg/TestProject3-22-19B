#open the plotting function library
library ("ggplot2")
#open the csv file
gapminder <-read.csv("data-shell/data-shell/gapminder_data.csv", header=TRUE)
#look at row 1, col 1
gapminder[1,1]
#look at row 1
gapminder[1,]
#look at first 6 rows, all cols
head(gapminder)
#look at last 6 rows
tail(gapminder)
#look at rows in middle
gapminder [900:905,]
#now plot some data
#ggplot is one command that sets the plot, 
#geom_point adds another layer with 
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point()
#now plot live expectancy vs time
ggplot(data=gapminder, aes(x=year, y=lifeExp)) +
  geom_point()
#now color points on the graph by continent
ggplot(data=gapminder, aes(x=year, y=lifeExp, color=continent)) +
  geom_point()

#now make this a line graph by country instead of dot plot
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country,
                           color=continent)) +
  geom_line()

#now plot by each continent with a line and scatter plot
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=continent)) + 
  geom_line(color="purple") + 
  geom_point() 

# this seems to plot all the data

ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country)) + 
  geom_line(color="purple") + 
  geom_point() 
# the order of the geom_line or geom_point determines
#which layer is over which
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country)) + 
  geom_point() +
geom_line(aes(color=continent))

#now back to our first graph
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, 
                           color=continent)) +
  geom_point()
  
#change the scale so we expand the x axis
#alpha =.5 makes points transparent 50%
#do a log transform on the x axis
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, 
                           color=continent)) +
  geom_point(alpha=0.5) +
  scale_x_log10()

#add a new layer: geom_smooth
#make linear fit "lm"
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, 
                           color=continent)) +
  geom_point(alpha=0.5) +
  scale_x_log10() +
  geom_smooth(method="lm")

#combine all the continents
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha=0.5) +
  scale_x_log10() +
  geom_smooth(method="lm")

#change the line thickness, point size, point color
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(alpha=0.5, size=2, col="red") +
  scale_x_log10() +
  geom_smooth(method="lm", size=1.5)

#change the points different shape, by continent
ggplot(data=gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) +
  geom_point(alpha=0.5, shape=2,size=2) +
  scale_x_log10() +
  geom_smooth(method="lm", size=1.5)