'
File-Name: atividade-1-palloma-marciano.R
Data: 2019, Ago 27
Author: Marciano, Palloma
Purpose: First activity of the course
Data Used: mpg

  
  *************************************
  **ATIVIDADE 1 - R FOR DATA SCIENCE **
  *************************************
  
'

install.packages("lintr")
library(lintr)

#1. Introduction

## Instalando pacotes
install.packages(c("nycflights13", "gapminder", "Lahman"))

1 + 2

## Updating a package
install.packages("tidyverse")
tidyverse_update() #Error =  could not find function "tidyverse_update"


# 2. Introduction

# 3. Data visualization

## Access to the data
library(tidyverse)

mpg

## Ploting (This is a scatterplot)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

## Template for ploting (see 3.2.3)
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

## Exercises 3.2.4

### 1. ggplot(data = mpg)
ggplot(data = mpg)
# A black image appears

### 2. How many rows are in mpg? How many columns?
mpg # 11 columns and 234 rows

### 3. What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
# f = front-wheel drive, r = rear wheel drive, 4 = 4wd

### 4. Make a scatterplot of hwy vs cyl.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

### 5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))
# There is no correlation between the variables and
# is not useful because there are many suboptions that
# indicates a categorival variable



## Exercises 3.3.1
### 1. It's missing a parenthesis in the code
  '''Change the code near y = hwy)'''
  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

### 2. Summary of the data
summary(mpg)
?mpg
# Categorical = 6
# Continuous = 5

### 3. How do these aesthetics behave differently for categorical 
# vs. continuous variables?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

### 4. Multiple aesthectics
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")+
  aes(x = displ, y = hwy, shape = class)
# It became confusing
  
### 5. stroke aesthetic 
?geom_point
# "For shapes that have a border (like 21), you can colour the inside and
# outside separately. Use the stroke aesthetic to modify the width of the
# border" Works better with the width of the border

### 6.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), colour = "displ < 5")
# The following message appears:'Error in grDevices::col2rgb(colour, TRUE) : 
# invalid color name 'displ < 5'


'''*Facets*, subplots that each display one subset of the data.'''


# Exercises 3.5.1

### 1. What happens if you facet on a continuous variable?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cty, nrow = 2)
# The visualization of the plot is not usefull

### 2. What do the empty cells in plot with facet_grid(drv ~ cyl) 
# mean? How do they relate to this plot?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv ~ cyl)
#There is no observations for the specific number of the variable drv

### 3. What plots does the following code make? What does . do?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
# Not facet in different dimensions as rows and columns. It takes the place
# of one of the variables.

### 4.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
# With the facets you can see distribution in more than to dimensions
# X and Y. Making the evaluation more precise and detailed.

### 5. 
?facet_wrap
# nrow / ncol= Number of rows and columns.
# Scales, shrink, labeller, as.table, switch, drop, dir
# Why doesn’t facet_grid() have nrow and ncol arguments?
# Because both are determined by the variable in the parentheses

### 6. When using facet_grid() you should usually put the variable 
# with more unique levels in the columns. Why?
# So the distribution between the subplots be more precise.


# A geom is the geometrical object that a plot uses to represent data.

http://rstudio.com/cheatsheets
?geom_smooth

# 3.6.1 Exercises

### 1.What geom would you use to draw a line chart? A boxplot? 
# A histogram? An area chart?
# A geom_smooth

### 2.Run this code in your head and predict what the output will 
# look like. Then, run the code in R and check your predictions.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

### 3.What does show.legend = FALSE do? What happens if you remove it?
# Why do you think I used it earlier in the chapter?
# To hide the legend. Idk

### 4.What does the se argument to geom_smooth() do?
# Able or disable the observations interval in the line of geom_smooth

### 5.Will these two graphs look different? Why/why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# They will not because they have the same specifications, just
# repeated. 

### 6.

# 1. 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# 2.
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy))

# 3. 
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv), se = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# 4. 
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# 5.
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# 6.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))


# 3.7.1 Exercises

### 1.What is the default geom associated with stat_summary()?
# A: geom_bar
#How could you rewrite the previous plot to use that geom function
#instead of the stat function?

# Original code
diamonds

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

# Code modified (stat to geom)
ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))

?stat_bin

### 2. 
ggplot(data = diamonds) + 
  geom_col(mapping = aes(x = cut, y = ..prop..))

?geom_col
# Bars that represent the values in the data. On the other hand,
# geom_bar() makes the he height of the bar proportional to the
#number of cases in each group

### 3. Most geoms and stats come in pairs that are almost 
#always used in concert. Read through the documentation and 
#make a list of all the pairs. What do they have in common?
# A: I didn´t understand.

### 4.What variables does stat_smooth() compute? What parameters 
# control its behaviour?
?stat_smooth
ggplot(data = diamonds) + 
  stat_smooth(mapping = aes(x = cut, y = depth), method = "auto")
# Error: `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

### 5. In our proportion bar chart, we need to set group = 1. Why? 
# In other words what is the problem with these two graphs?

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
# Both give a incorrect probability without the group specification

# 3.8.1 Exercises

### 1. What is the problem with this plot? How could you improve it?
#Original code
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

# Modified code = jitter option to improve randomess
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy), position = "jitter")

### 2. What parameters to geom_jitter() control the amount of jittering?
?position_jitter
# A: The width and the height

### 3. Compare and contrast geom_jitter() with geom_count().
?geom_count()
?geom_jitter()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +  
  geom_jitter()
#The jitter option presens a more clear scatterplot and its observations.

### 4.What’s the default position adjustment for geom_boxplot()? 
# Create a visualisation of the mpg dataset that demonstrates it.

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = cty, y = hwy, group = 1))

?geom_boxplot
# Inserting the group option makes the code work.


# 3.9.1 Exercises

### 1. Turn a stacked bar chart into a pie chart using coord_polar().
ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    width = 1
  ) 
  
bar + coord_polar()

### 2. What does labs() do? Read the documentation.
?labs()
#A: Define the labels of the variables, titles and subtitles.

?coord_quickmap() 
# projects a portion of the earth, which is approximately spherical and
# and preserves the straight lines.

?coord_map() 
# projects a portion of the earth, which is approximately spherical,
# Without straight lines.

### 4.What does the plot below tell you about the relationship between 
# city and highway mpg? Why is coord_fixed() important? What 
# does geom_abline() do?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline()  # Inserts a correlation line to the scatterplot


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline() + # Inserts a correlation line to the scatterplot
  coord_fixed() # Corrects the proportions of the coordinates

 
"CODE TEMPLATE" # 3.10 The layered grammar of graphics

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
    mapping = aes(<MAPPINGS>),
    stat = <STAT>, 
    position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>
  

  
# 4 Workflow: basics
  
# 4.3 Calling functions
  
seq(1, 10)

x <- "hello world"

> x <- "hello"

# 4.4 Practice

### 1. Why does this code not work?

my_variable <- 10
my_varıable

#A: Because the "i" is not correct

### 2. Tweak each of the following R commands so that they run correctly:

'library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

fliter(mpg, cyl = 8)
filter(diamond, carat > 3)'

library(tidyverse)

mpg

diamonds

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)
  
### 3. Press Alt + Shift + K. What happens? How can you get to 
# the same place using the menus?
# A: Keyboard shortcuts appears. In the menus, press the Tools bottom and
# look for the Keyboard Shortcut Help.



# 5. Data transformation / Data manipulation

library(nycflights13)
install.packages("nycflights13")
library(nycflights13)
library(tidyverse)

flights

filter(flights, month == 1, day == 1)

# To save the result "<-"

jan1 <- filter(flights, month == 1, day == 1)

# Printing the results and saving them to a varible "()"

(dec25 <- filter(flights, month == 12, day == 25))

# Instead of relying on ==, use near(). Aproximation!

# 5.2.2 Logical operators <- see in the book

# 5.2.4 Exercises

### 1. Find all flights that

# 1.1 Had an arrival delay of two or more hours

filter(flights, arr_delay >= 120)

# 1.2 Flew to Houston (IAH or HOU)

filter(flights, dest == "IAH" | dest == "HOU")

# 1.3 Were operated by United, American, or Delta

filter(flights, carrier == "United" | 
         carrier == "American" | carrier == "Delta")

# 1.4 Departed in summer (July, August, and September)

filter(flights, month %in% c(7, 8, 9))

# 1.5 Arrived more than two hours late, but didn’t leave late

filter(flights, arr_delay >= 120, dep_delay <= 0)

# 1.6 Were delayed by at least an hour, but made up over 30 
# minutes in flight

filter(flights, arr_delay >= 60, air_time >= 30)

# 1.7 Departed between midnight and 6am (inclusive)

filter(flights, dep_time >= 000, dep_time <= 600)

# 2. Another useful dplyr filtering helper is between(). What does 
# it do? Can you use it to simplify the code needed to answer the 
# previous challenges?

?between

# A: A shortcut to >= and <=. E.g.:

filter(flights, between(dep_time, 000, 600))

filter(flights, between(month, 7, 9))

# 3. How many flights have a missing dep_time? What other variables
# are missing? What might these rows represent?

filter(flights, is.na(dep_time))

# A: There missing values in dep_delay, arr_time. It probably means
# that the flights were canceled.

# 4. Why is NA ^ 0 not missing? 
# A:  Because every operation with NA has the NA result. Then is not
# possible to identify the result.

# Why is NA | TRUE not missing? 
# A: It can include FALSE results.

# Why is FALSE & NA not missing? 
# A: Because false is just a condition that is meets or not. NOt
# missing values itself. So it's different form NA.

# Can you figure out the general rule? # (NA * 0 is a tricky 
# counterexample!)
# IDK yet.


# 5.3 Arrange rows with arrange()

# 5.3.1 Exercises

# 1. How could you use arrange() to sort all missing values to 
# the start? (Hint: use is.na()).

arrange(flights, is.na(dep_time))

?arrange

# 2. Sort flights to find the most delayed flights. Find the 
# flights that left earliest.

arrange(flights, desc(dep_delay))

arrange(flights, (dep_time))

# 3. Sort flights to find the fastest flights.

flights %>% arrange(air_time)
arrange(flights, (air_time))

# 4. Which flights travelled the longest? Which travelled the shortest?

arrange(flights, (distance))

arrange(flights, desc(distance))


'5.4.1 Exercises'

'1. Brainstorm as many ways as possible to select dep_time, dep_delay, 
arr_time, and arr_delay from flights.'

library(nycflights13)

flights

select(flights, dep_time, dep_delay, arr_time, arr_delay)

select(flights, dep_time:arr_delay) # Don't match

'2. What happens if you include the name of a variable multiple times in 
a select() call?'

select(flights, dep_time, dep_time, dep_time, dep_time)
# The variable is only select one time, one column.

'3. What does the one_of() function do? Why might it be helpful in 
conjunction with this vector?

vars <- c("year", "month", "day", "dep_delay", "arr_delay")'

?one_of
# Matches variable names in a character vector. 

library(tidyselect)
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
# Problems using the function

'4. Does the result of running the following code surprise you? How do 
the select helpers deal with case by default? How can you change that 
default?

select(flights, contains("TIME"))'

select(flights, contains("TIME"))

select(flights, contains(match, ignore.case = TRUE, vars = peek_vars(delay)))


'5.5 Add new variables with mutate()'

# Why separate the ) during a command?

'5.5.2 Exercises'

'1. Currently dep_time and sched_dep_time are convenient to look at, 
but hard to compute with because they’re not really continuous numbers.
Convert them to a more convenient representation of number of minutes 
since midnight.'

flights_x <- select(flights,
                    dep_time,
                    sched_dep_time
                    )

mutate(flights_x,
       departure = dep_time / 60,
       schedule = sched_dep_time / 60
       )

'2. Compare air_time with arr_time - dep_time. What do you expect to 
see? What do you see? What do you need to do to fix it?'

?compare











