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




