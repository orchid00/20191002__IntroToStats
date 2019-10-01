## BNE RLad-5.R
##########################################
## Regression
# A very simple example
##########################################

library(car)
library(carData)
data(Davis)
nrow(Davis)
names(Davis)
plot(Davis)
# First model named davis.mod
davis.mod <- lm(weight ~ repwt, data = Davis)
davis.mod
summary(davis.mod)
confint(davis.mod)

library(lattice)
with(Davis, scatter.smooth(weight, repwt))
with(Davis, which.max(weight))

# Update model to make davis.mod2
davis.mod2 <- update(davis.mod, subset = -12)
summary(davis.mod2)

cbind(Original = coef(davis.mod), NoCase12 = coef(davis.mod2))

## Data without extreme value and subsetting for fema
davis.modf <- lm(weight ~ repwt,
  data = Davis,
  subset = sex == "F"
)
summary(davis.modf)
cbind(
  Original = coef(davis.mod), NoCase12 = coef(davis.mod2),
  Female = coef(davis.modf)
)

## Compare the two models
qqPlot(davis.mod)
residualPlots(davis.mod)

qqPlot(davis.mod2)
residualPlots(davis.mod2)

