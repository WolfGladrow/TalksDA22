print('file: B2-PDsPDFsNegativeBinomialPDexample.R')
# negative binomial distribution 
ka = seq(0,30)   # number of failures before sth success occurs
s = 5            # (chosen) number of successes: integer > 0 or s = 1,2,3, ...
p = 0.3          # probability of success in single Bernoulli trial
pNBD = dnbinom(ka,s,p)  # sum(pNBD)
# png('NegativeBinomial180717.png',width=16,height=16,units='cm',res=300)
plot(ka,pNBD,type='p',lwd=4,col='black',xlab='Number of successes, k',
     ylab='Probability',las=1,cex=0.6,cex.lab=1.5)
text(5,0.02,bquote(~s == .(s)),col='black',pos=4,cex=1.5)
text(5,0.01,bquote(~p == .(p)),col='black',pos=4,cex=1.5)
# dev.off()
