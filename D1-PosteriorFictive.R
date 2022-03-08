print('file: D1-PosteriorFictive.R')
# fictive posterior 
# converted from MATLAB
dx = 0.01; x = seq(0,4,dx);
mu = 2; sigma = 1;
y = 1/sigma/sqrt(2*pi)*exp(-(x-mu)^2/2/sigma^2);
z = 1+0.2*sin(x*3);
p = y*z    #proximately normalize:
s = sum(p)*dx
p = p/s;
pmean = sum(x*p)*dx
pvar = sum((x-pmean)^2*p)*dx 
pstd = sqrt(pvar)             
# [pmax kmax] = max(p);
pmax = max(p)
kmax = which.max(p)
alpha_opt = x[kmax]
# ----------------------
xp1 = c(alpha_opt, alpha_opt); yp1 = c(0, pmax);
xp2 = c(alpha_opt-pstd, alpha_opt+pstd); yp2 = c(pmax, pmax)/4;
library(latex2exp)
# png('PosteriorFictive220308.png',width=16,height=12,units='cm',res=300)
plot(x,p,type='l',lwd=4,col='black',xlab=TeX('$\\hat{\\beta}$'),
     ylab='Posterior, fictive',las=1,cex=0.6,cex.lab=1.5)
lines(xp1,yp1,col='blue',lty=4,lwd=2)
lines(xp2,yp2,col='magenta',lty=2,lwd=2)
text(0,0.4,TeX('$\\hat{\\beta} = 2.36$'),col='blue',cex=1.5,pos=4)
text(0.75,0.4,TeX('$\\pm 0.89$'),col='magenta',cex=1.5,pos=4)
# dev.off()