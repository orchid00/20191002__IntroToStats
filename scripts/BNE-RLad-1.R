## BNE-RLad-1.R
############################################
## T tests and Sample size Calculations
############################################


vector1 <- c(5.1, 5.2, 5.3, 5, 5, 5, 5, 5, 5, 5)
vector2 <- c(5.1, 5.2, 5.3, 5, 5, 5, 5, 5, 5, NA)

mean(vector1)
mean(vector2)

mean(vector2, na.rm = TRUE)

# using cars (data set comes with R )
# Let's explore the data; get familiar with the data
head(cars)
tail(cars)

summary(cars)
dim(cars)
class(cars)
# Check the variable names
names(cars)
mean(cars$dist)
min(cars$dist)
max(cars$dist)
length(cars$dist)
median(cars$dist)

var(cars$dist)
sd(cars$dist)

## Single Sample t test
## Could this data come from a population with mean 0


observed <- c(0.52, 0.20, 0.59, 0.62, 0.60)
theoretical <- 0

t.test(observed,
  mu = theoretical,
  conf.int = 0.95
)


## Two Sample t test
# Classical example: Student's sleep data
# Understand the data and the RQ

names(sleep)
summary(sleep)

plot(extra ~ group, data = sleep)

## (1) Traditional interface
with(sleep, t.test(extra[group == 1], extra[group == 2]))

## (2) Formula interface
t.test(extra ~ group, data = sleep)


## Paired t test (think of a block with one pair per block)
# Left and right eyes for several people
## Twin data for several sets of twins
## Before and after test scores (after training)

## Two varieties, in 8 blocks
VarA <- c(17.8, 18.5, 12.2, 19.7, 10.8, 11.9, 15.6, 12.5)
VarB <- c(14.7, 15.2, 12.9, 18.3, 10.1, 12.2, 13.5, 9.9)
length(VarA)
Diff <- VarA - VarB
Diff

t.test(VarA, VarB, mu = 0, paired = TRUE)

## paired=TRUE: conduct paired t test##


# Power for t tests Str(t.test)

library(pwr)
# Single sample
pwr.t.test(d = 0, n = 5, sig.level = 0.05, type = "one.sample", alternative = "two.sided")


# Two sample - look at a comparison
# pwr.t.test: two-sample, one-sample and paired t-tests
pwr.t.test(n = 30, d = 0.5, sig.level = 0.05)

pwr.t.test(d = 0.5, power = 0.80, sig.level = 0.05)


# pwr.t2n.test: two-sample t-tests (unequal sample sizes)

pwr.t2n.test(n1 = 28, n2 = 35, d = 0.5)


## Paired t-tests are basically the same as one-sample t-tests, except our one sample is usually differences in pairs. The following example should make this clear.

pwr.t.test(
  n = 24, d = 0.08 / 0.25,
  type = "paired", alternative = "greater"
)

# only  45 percent. Not all that powerful! How many high school boys should we sample for 80\% power?

pwr.t.test(
  d = 0.08 / 0.25, power = 0.8,
  type = "paired", alternative = "greater"
)

