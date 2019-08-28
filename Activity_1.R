#Atividade 1 - R for Data Science

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

## Template for ploting (see 3.2.2)
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

## Exercises

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

## Map the colors of your points based on class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#> Warning: Using size for a discrete variable is not advised.

##Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

## Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))


