# LOG-NORMAL DISTRIBUTION
n <- 10000
mu <- 5
sigma <- 1
Z <- rnorm(n, mu, sigma) # N(mu, sigma)
X <- exp(Z) # log-norm(mu, sigma)

mean(X) # exp(mu + sigma^2/2)
exp(mu + sigma^2/2)

b <- 2
Y <- b*X # log-norm(mu + lnb, sigma)

mean(Y)
exp(mu + log(b) + sigma^2/2) # or
b*exp(mu + sigma^2/2)

# WIG
source("etl.R")
dax <- read.stooq.asset.price("^dax_q.csv")
dax <- returns.from.prices(dax)

hist(dax, freq = FALSE, breaks = 30)
shapiro.test(dax) # seems to be normal
x = seq(-1, 1, by=.01)
lines(x, dnorm(x, mean(dax), sd(dax)))
