#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#ggplot2 and tidyverse are already "installed" in google colab, so we just need to load them with library()
#install.packages("ggplot2")
library(ggplot2) #used for plotting
library(tidyverse) #a "universe" of data science R packages helpful for data reading and data wrangling.

#install plotly, gt, and ggpairs R packages. Takes about 2-3 minutes.
#install.packages("plotly")
#install.packages("gt")
#install.packages("GGally")

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#check structure of the dataset
str(diamonds)

#using ggplot() creates the canvas we'll be using.
 #inform ggplot we're using "diamonds" dataframe
ggplot(data = diamonds)

#specifying the aesthetic mappings adds ...
 #define an aesthetic mapping (using the aesthetic (aes) function)
 #specify variables to be plotted and how to present them
 #e.g., x axis, y axis, colour, size, etc.
ggplot(data = diamonds,                           #use diamonds dataframe
  mapping = aes(x=carat, y=price, color = cut))   #carat on x axis. Price on y.

ggplot(data = diamonds,                           #use diamonds dataframe
  mapping = aes(x=mean(carat), color = cut)) +
    geom_dot()

#adding 'geoms': graphical representation of data.
 #e.g., points, lines, bars
 ggplot(data = diamonds,                           #use diamonds dataframe
  mapping = aes(x=carat, y=price, color = cut)) +  #carat on x axis. Price on y.
    geom_point()                                   #use points (dots)

```
#
#
#
#
#

#Generalized Pairs Plot
mtcars_subset <- mtcars |> dplyr::select(where(is.numeric))

p <- GGally::ggpairs(mtcars,
lower=list(combo=GGally::wrap("facethist", bins=6))) +
ggtitle("Assoc. among car MPG, displacement,\ntransmission, and num gears") +
theme_bw(base_size=16) + labs(x=NULL, y=NULL)
p


#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#idiom: scatterplot.
 #two continuous variables
p <- diamonds %>%
ggplot(aes(x=carat, y=price)) +
geom_point(size=1.8) +
labs(title="Price of diamond") +
theme_bw(base_size = 18)
p
#can add colour or shape

#
#
#
#Scatterplot w/ histogram
# install.packages("ggplot2")
# install.packages("ggExtra")
library(ggplot2)
library(ggExtra)

# Save the scatter plot in a variable
p <- ggplot(cars, aes(x = speed, y = dist)) +
  geom_point()

# Changing the relative size
ggMarginal(p, type = "histogram",
           size = 3)

#
#
#

#histogram
p <- cars %>%
ggplot(aes(x=dist)) +
geom_histogram(binwidth=25, fill="grey", color="black") +
labs(title="Price of book", subtitle="Bin size = 25") +
theme_bw(base_size = 18)
p

```
#
#Bar chart
 #1 categorical, 1 continuous
p <- diamonds %>%
ggplot(aes(x=clarity, y=price)) +
stat_summary(fun="mean",geom="bar", size=1.5) + #geom_bar()
labs(title="Mean price of diamond by clarity") +
theme_bw(base_size = 18)
p
#
#
#
#stacked bar chart
 #to add
#
#
#
#
#
#lollipop plot
p <- data %>%
arrange(value) %>% # First sort by val. This sorts the dataframe but NOT
the factor levels
mutate(name=factor(name, levels=name)) %>% # This trick updates the
factor levels
ggplot(aes(x=name, y=value)) +
geom_segment(aes(xend=name, yend=0)) +
geom_point(size=4, color="orange") +
coord_flip() + theme_bw(base_size = 24) + xlab("")

#
#
#

#line chart
p <- ggplot(bitcoin, aes(x=Date, y=Close)) +
geom_line(size=1.5) + theme_bw(base_size=24) +
labs(title="Bitcoin prices over the past 12 months", y="Closing price
(USD)") +
theme(axis.text.x = element_text(angle=45, hjust=0.9))
#
#
#
#bar plot
p <- bfi %>%
ggplot(aes(x=education, y=otot)) +
geom_boxplot() +
labs(title="BFI openness to experience", subtitle="split by education
level") +
coord_flip() +
theme_bw(base_size = 24) + theme(panel.grid.major.x = element_blank())
#
#
#

#Heatmap
p <- ggplot(volcano_df, aes(x=East_West, y=North_South, fill=Height)) +
geom_tile() + coord_fixed() + scale_fill_viridis_c(option="inferno") +
labs(x="East - West position", y="North - South position", title="Height of
Mt. Eden (Auckland)")
plot(p)

#
#
#
#Scatterplot matrix
p <- ggscatmat(mtcars %>% select(mpg, disp, hp, wt)) +
ggtitle("Assoc. among car MPG, displacement,\nhorsepower, and weight") +
theme_bw(base_size=18) + labs(x=NULL, y=NULL)
#
#
#
#
#
#
#

#normalized stacked bar chart
p <- diamonds %>%
ggplot(aes(x=cut, fill=color)) +
geom_histogram(stat="count", position="fill") +
labs(title="Number of diamonds by cut and color") +
theme_bw(base_size = 18) + ylab("Proportion")
#
#
#
#
#
#
#
#

# density plots aka Frequency Polygon
p <- diamonds %>%
ggplot(aes(x=price, color=clarity)) +
geom_density(size=1.8) +
labs(title="Price of diamond", subtitle="color denotes clarity") +
theme_bw(base_size = 18)
p
#
#
#
#pie chart
dcount <- diamonds %>% group_by(color) %>% tally()
p <- dcount %>%
ggplot(aes(x="", y=n, fill=color)) +
geom_bar(stat="identity", width=1) +
coord_polar("y") +
labs(title="Number of diamonds by cut and color") +
theme_void(base_size = 18)
p
#
#
#
#bar plot and facet wrap
#
ggplot(bfi_long,
aes(x=response)) +
geom_bar(stat = "count") +
facet_wrap(~item)
#
#
#
#
#
#
#
#

library(plotly)
library(dplyr)
library(gapminder)

#clean data
data <- gapminder %>% 
filter(year=="2007") %>% 
dplyr::select(-year)

#create ggplot2 graph
p <- ggplot(data, 
aes(x=gdpPercap, y=lifeExp, size = pop)) +
              geom_point(alpha=0.7)

#convert ggplot2 graph to interactive plotly object
ggplotly(p)

#
#
#
#
#
library(plotly)
library(dplyr)
library(gapminder)

data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
p <- data %>%
      arrange(desc(pop)) %>%
      mutate(country = factor(country, country)) %>%
      ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
        geom_point(alpha=0.5) +
        scale_size(range = c(.1, 24), name="Population (M)")

ggplotly(p)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
p <- data %>%
      arrange(desc(pop)) %>%
      mutate(country = factor(country, country)) %>%
      ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
        geom_point(alpha=0.5) +
        scale_size(range = c(.1, 24), name="Population (M)")

ggplotly(p)
#
#
#
#
#

set.seed(1234)
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), rating = c(rnorm(200),rnorm(200, mean=.8)))

p <- ggplot(dat, aes(x=cond, y=rating, fill=cond)) + geom_boxplot()

ggplotly(p)

#
#
#
#
#
library(plotly)

df <- data.frame (type=rep(1:2, each=1000), subtype=rep(c("a","b"), each=500), value=rnorm(4000, 0,1))

library(plyr)
df.text<-ddply(df,.(type,subtype),summarise,mean.value=mean(value))

p <- ggplot(df, aes(x=value, fill=subtype)) +
    geom_histogram(position="identity", alpha=0.4)+
    facet_grid(. ~ type)

ggplotly(p)

#
#
#
#
#
#
#
library(plotly)
library(ggplot2)
library(gapminder)


p <- ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent)) +
  geom_point(aes(size = pop, frame = year, ids = country)) +
  scale_x_log10()

fig <- ggplotly(p)
fig
#
#
#
#
#
#
#
#specify animation options
fig %>% 
  animation_opts(
    1000, easing = "elastic", redraw = FALSE
  )


#
#
#
fig 
#
#
#
  
  fig %>%
  animation_slider(
    currentvalue = list(prefix = "YEAR ", font = list(color="red"))
  )

fig
#
#
#
#
#testing gt functionality in jupyter notebook.
gt_tab <- ggplot2::diamonds |> dplyr::count(cut) |> gt::gt()

#workaround so gt plays nice with jupyter notebooks.
gts <- function(gt_table){
   gt:::as.tags.gt_tbl(gt_table)
}
gts(gt_tab)
#
#
#
