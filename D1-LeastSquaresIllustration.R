print('file: D1-LeastSquaresIllustartion.R')
# least squares illustration
X = c(0.8, 1.5, 2.4, 3.0, 4.1)  # capital/uppercase X
y = c(1.4, 2.6, 3.5, 1.1, 4.4)
out1 = lm(y ~ X)
out2 = summary(out1)
b0 = out2$coefficients[1]; print(c(round(b0,4),'b0'))
b  = out2$coefficients[2]; print(c(round(b,4),'b'))
ub0 = out2$coefficients[3]; print(c(round(ub0,4),'ub0'))
ub  = out2$coefficients[4]; print(c(round(ub,4),'ub'))
xi = X; yi = y; y0 = b*xi+b0; L = length(xi);
xp = seq(0,5,0.1); yp = b0+b*xp;
library(latex2exp)
# png('LSillustration220308.png',width=16,height=16,units='cm',res=300)
plot(xp,yp,type='l',lwd=3,col='magenta',xlab='x',ylab='y(x)',las=1,cex=0.4,cex.lab=1.5,
     xlim=c(0,5),ylim=c(0,5),asp=1)
points(X,y,col='blue',cex=0.6,lwd=4)
text(0,4.5,TeX('$\\hat{\\beta}_0 = 1.14 \\pm 1.35$'),col='magenta',pos=4,cex=1.5)
text(0,4.0,TeX('$\\hat{\\beta} = 0.62 \\pm 0.51$'),col='magenta',pos=4,cex=1.5)
for (n in 1:L) {
  x1 = xi[n]; y1 = b*xi[n]+b0;
  x2 = x1; y2 = yi[n];
  x3 = x1+abs(y2-y1); y3 = y2;
  x4 = x3; y4 = y1;
  x5 = x1; y5 = y1;
  xf = c(x1, x2, x3, x4, x5);
  yf = c(y1, y2, y3, y4, y5);
  polygon(xf,yf,col='yellow')
}
# dev.off()
# ----------------------------------------------------------------
# Remarks:
# R output from lm():
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)
# (Intercept)   1.1437     1.3470   0.849    0.458
# X             0.6171     0.5131   1.203    0.315
#
# R and MATLAB yield identical output for linear regression; my guess: both systems
#    use the same routine written in S or C
# ----------------------------------------------------------------