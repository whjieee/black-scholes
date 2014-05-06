source('black-scholes.r')

par(family="sans", mar=c(4,4,1,2)+0.1, mgp=c(2,1,0))

dump <- function(filename) {
  fn <- paste("images/", filename, ".pdf", sep="")
  dev.copy2pdf(file=fn, family="sans")
}

plot(function(S){bscall.value(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="")
plot(function(S){bsput.value(S,100,0.5,0.05,0.20)}, 70, 130, add=T, col="#d63d00", lwd=3)
title(main='', xlab='Stock Price', ylab='Value')
legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-value')

plot(function(S){bscall.delta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-1,1))
plot(function(S){bsput.delta(S,100,0.5,0.05,0.20)}, 70, 130, add=T, col="#d63d00", lwd=3)
abline(0,0)
title('', xlab='Stock Price', ylab='Delta')
legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-delta')

plot(function(S){bscall.gamma(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,0.03))
title('', xlab='Stock Price', ylab='Gamma')
legend('topleft', c('Call Gamma'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-gamma')

plot(function(S){bscall.value(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="")
plot(function(S){bscall.value(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
plot(function(S){bscall.value(S,100,0.1,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
title('', xlab='Stock Price', ylab='Value')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.1'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-value-ttm')

plot(function(S){bscall.theta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-10,8))
plot(function(S){bsput.theta(S,100,0.5,0.05,0.20)}, 70, 130, add=T, col="#d63d00", lwd=3)
abline(0,0)
title('', xlab='Stock Price', ylab='Theta')
legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-theta')

plot(function(S){bscall.gamma(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,0.07))
plot(function(S){bscall.gamma(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", add=T)
plot(function(S){bscall.gamma(S,100,0.1,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", add=T)
title('', xlab='Stock Price', ylab='Value')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.1'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-gamma-ttm')

plot(function(S){bscall.theta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-15,5))
plot(function(S){bscall.theta(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", add=T)
plot(function(S){bscall.theta(S,100,0.1,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", add=T)
abline(0,0)
title('', xlab='Stock Price', ylab='Theta')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.1'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-theta-ttm')

plot(function(S){bscall.vega(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,30))
title('', xlab='Stock Price', ylab='Vega')
legend('topleft', c('Call Vega'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-vega')
