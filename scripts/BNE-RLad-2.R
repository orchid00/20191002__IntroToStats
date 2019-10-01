## BNE-RLad2.R
##################################################
## Aims to randomise an experiment using a package
## Be able to use this output to impliment the design
## Carry out the designed factorial experiment
# Research Question - require an experiment
# Plan  two factors - gives efficiency
##################################################
# It is a spanish package so spelling is different

library("agricolae")
# look at function use str
str(design.rcbd)


trt <- c("A", "B", "C", "D", "E")
rep <- 4
outdesign <- design.rcbd(trt, r = rep, seed = -513, serie = 2)
book2 <- outdesign$book
book2 <- zigzag(outdesign) # zigzag numeration
print(outdesign$sketch)
print(matrix(book2[, 1], byrow = TRUE, ncol = 5))

write.csv(book2, "generateddata/RCBDbook.csv", row.names = FALSE)
# If you wish to take into Excel etc for randomising

## Second Example.  Blocks, and a Factorial Design
## Two factors

str(design.ab)

trt <- c(3, 2) # factorial 3x2
outdesign <- design.ab(trt, r = 3, serie = 2)
book12 <- outdesign$book
head(book12) # print of the field book


# If you wish to take into Excel etc for randomising
write.csv(book12, "generateddata/ABbook.csv", row.names = FALSE)

## Referencing this  R  package you use

citation("agricolae")
