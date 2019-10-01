### BNE-RLad-4.R
##############################################
# ANOVA and a planned comparison for looking at
## a preplanned Reseach question
## Two exampes  (A) rat diet
## (B) Poison
##############################################

rats.diet <- read.csv("data/rats-diet.csv")
names(rats.diet)

## Make a Factor for the litter


rats.diet$Lit <- as.factor(rats.diet$Litter)


## Run an ANOVA
## aov requires balanced data

modr <- aov(Gain ~ Lit + Diet, data = rats.diet)
anova(modr)


## Look at treatments in more detail

library(agricolae)

HSD1 <- HSD.test(modr, "Diet",
  group = TRUE,
  console = TRUE,
  main = "Honest Tukey difference for Diet"
)
levels(rats.diet$Diet)


## One-way ANOVA incorporating  contrasts within Diet

## Orthogonal comparison
## Preplanned contrasts


library(emmeans)
Rat <- factor(c(
  "DietA", "DietB",
  "DietC", "DietD", "DietE"
))
contr.treatment(Rat)

vec1 <- c(1, 1, 1, 1, -4) # ABCD v E
vec2 <- c(0, 0, -0.5, -0.5, 1) # CD   v E

cons <- as.matrix(cbind(vec1, vec2))
modDiet <- aov(Gain ~ Lit + Diet,
  data = rats.diet,
  contrast = list(Diet = cons)
)
Diet.cont <- summary(modDiet,
  split = list(Diet = list(
    "ABCD v E" = 1,
    "CD v E" = 2
  ))
)

Diet.cont


## Second Example


poison <- read.csv("data/poison.csv")
names(poison)
str(poison)
modL <- aov(Time ~ Poison * Treatment, data = poison)
anova(modL)


## Interaction plots


with(data = poison, expr = {
  interaction.plot(Poison, Treatment, response = Time)
  interaction.plot(Treatment, Poison, response = Time)
})

model.tables(modL, type = "means")

TukeyHSD(modL, which = c("Poison", "Treatment"))

plot(TukeyHSD(modL, which = c("Poison", "Treatment")))
pairwise.t.test(poison$Time, poison$Poison)

pairwise.t.test(poison$Time, poison$Treatment)
