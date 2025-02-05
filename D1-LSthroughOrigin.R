print('file: D1-LSthroughOrigin.R')
# straight line through origin
# ------------------------- generate artificial data
set.seed(1953) # set seed for random number generators
n = 8      # sample size, number of data pairs
beta = 2.1  # (true) slope
x = seq(1,n)
y = beta*x+3*rnorm(n)  # exact values plus normal noise
out1 = lm(y ~ x)   # ------------------------- simple linear regression
out2 = lm(y ~ x-1) # ------------------------- simple linear regression through origin
# ------------------------- plot data & fits:
out1s=summary(out1)
b0 = out1s$coefficients[1];  print(c(round(b0,2),'b0'))
b = out1s$coefficients[2];   print(c(round(b,2),'b'))
ub0 = out1s$coefficients[3]; print(c(round(ub0,2),'ub0'))
ub = out1s$coefficients[4];  print(c(round(ub,2),'ub'))
out2s=summary(out2)
c1  = out2s$coefficients[1]; print(c(round(c1,2),'c1'))
uc1 = out2s$coefficients[2]; print(c(round(uc1,2),'uc1'))
xp = c(0,n); y1 = b0+b*xp; y2 = c1*xp
# png('LineThroughOrigin220308.png',width=16,height=12,units='cm',res=300)
plot(x,y,type='p',lwd=3,col='blue',xlab='x',ylab='y',
     las=1,cex=0.4,xlim=c(0,n),ylim=c(-2.5,max(y)),cex.lab=1.5)
lines(xp,y1,col='black',lwd=1,lty=4)
lines(xp,y2,col='red',lwd=3,lty=1)
text(0,10,expression(paste(hat(beta))),col='red',pos=4,cex=1.5)
text(0.4,10,paste(' = ',as.character(round(c1,2)),'\u00B1',
                  as.character(round(uc1,2))),col='red',pos=4,cex=1.5)
text(4,3,expression(paste(hat(beta))),col='black',pos=4,cex=1.5)
text(4.4,3,paste(' = ',as.character(round(b,2)),'\u00B1',
                 as.character(round(ub,2))),col='black',pos=4,cex=1.5)
text(4,0,expression(paste(hat(beta)[0])),col='black',pos=4,cex=1.5)
text(4.4,0,paste(' = ',as.character(round(b0,2)),'\u00B1',
                 as.character(round(ub0,2))),col='black',pos=4,cex=1.5)
legend('topleft',legend=c('linear regression through origin','linear regression, unconstrained'),
       col=c('red','black'),lty=c(1,4),lwd=c(3,1),cex=1.2)
# dev.off()