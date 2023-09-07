library(ggplot2)

data(mpg)

summary(mpg)

mpg$year <- as.factor(mpg$year)

summary(mpg)


library(h2o)


h2o.init()


data(mpg, package = "ggplot2")
mpg_h2o <- as.h2o(mpg)


glm_model <- h2o.glm(y = "cty", x = c("year", "cyl", "displ"), training_frame = mpg_h2o)


coefficients_table <- h2o.coef(glm_model)
print(coefficients_table)

#The negative coefficient for "displ" indicates that larger engine displacements are associated
#with lower city mpg, while the positive coefficient for "year" suggests that newer vehicles tend 
#to have better city mpg. The coefficient for "cyl" suggests that more cylinders are associated 
#with lower city mpg.






h2o.shutdown()
