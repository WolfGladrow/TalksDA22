print('file: B2-PDsPDFsHypergeoPDexample.R')
# hypergeometric distribution
N = 5   # total number of balls
W = 4   # number of white balls
B = N-W # number of black balls
J = 3   # number of balls drawn from the urn 
karr = seq(0,J); xk = seq(-1,J+1,0.01)
# dhyper(x, m, n, k, log = FALSE)
# m	the number of white balls in the urn.
# n	the number of black balls in the urn.
# k	 the number of balls drawn from the urn.
yPD = dhyper(x=karr,m=W,n=B,k=J)
# png('Hypergeo160817.png',width=16,height=16,units='cm',res=300)
plot(karr,yPD,type='p',lwd=4,col='blue',xlab='k',
     ylab='Probability',cex=0.6,las=1,cex.lab=1.5)
text(0.1,0.5,bquote(~N == .(N)),col='black',cex=1.5,pos=4)
text(0.1,0.4,bquote(~W == .(W)),col='black',cex=1.5,pos=4)
text(0.1,0.3,bquote(~J == .(J)),col='black',cex=1.5,pos=4)
# dev.off()