'''
File-Name: Activity_1
Data: 2019, Ago 27
Author: Marciano, Palloma
Purpose: First activity of the course
Data Used: mpg

  
  *************************************
  **ATIVIDADE 1 - R FOR DATA SCIENCE **
  *************************************
  
'''

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

### 4.









