# EL Hoffman
# 2023-01-24
# class notes for ice mass loss

ant_ice_loss=read.table(file='data/antarctica_mass_200204_202209.txt',skip=31,sep='',header=F,col.names=c('decimal_date','mass_Gt','sigma_Gt'))

grn_ice_loss=read.table(file='data/greenland_mass_200204_202209.txt',skip=31,sep='',header=F,col.names=c('decimal_date','mass_Gt','sigma_Gt'))

# nice to take a peak of data frame shape
head(grn_ice_loss)
tail(ant_ice_loss)
summary(ant_ice_loss)

## plotting
plot(x=ant_ice_loss$decimal_date,y=ant_ice_loss$mass_Gt, ylab="Antarctic Mass Loss (Gt)",xlab="Year")
# can call data more efficiently tho
plot(mass_Gt ~ decimal_date, data=grn_ice_loss, ylab="Ice Mass Loss (Gt)",xlab='Year',type='l',ylim=range(grn_ice_loss$mass_Gt))
# add another line for ant 
lines(mass_Gt ~ decimal_date, data=ant_ice_loss,col='red')

# know there's a data break tho! so adding some NA values
data_break=data.frame(decimal_date=2018.0,mass_Gt=NA,sigma_Gt=NA)
data_break

ant_ice_loss_with_NA=rbind(ant_ice_loss, data_break)
ant_ice_loss_with_NA=ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date),] # asking for new df to be all the rows but in the new sorted order (what the order fxn does) and then all the columns copy normally

grn_ice_loss_with_NA=rbind(grn_ice_loss,data_break)
grn_ice_loss_with_NA=grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

# now try plotting that one
plot(mass_Gt~decimal_date,data=ant_ice_loss_with_NA,ylab="Ice Mass Loss (Gt)",xlab='Year',type='l',ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE))
lines(mass_Gt~decimal_date,data=grn_ice_loss_with_NA,type='l',col='red')

# now adding error bars! NASA data has a sigma value included
plot(mass_Gt~decimal_date,data=ant_ice_loss_with_NA,ylab="Ice Mass Loss (Gt)",xlab='Year',type='l',ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE)) + 
  lines((mass_Gt+2*sigma_Gt)~decimal_date,data=ant_ice_loss_with_NA,type='l',lty='dashed') + 
  lines((mass_Gt-2*sigma_Gt)~decimal_date,data=ant_ice_loss_with_NA,type='l',lty='dashed')+ 
  lines(mass_Gt~decimal_date,data=grn_ice_loss_with_NA,type='l',col='red') + 
  lines((mass_Gt+2*sigma_Gt)~decimal_date,data=grn_ice_loss_with_NA,type='l',lty='dashed',col='red') + 
  lines((mass_Gt-2*sigma_Gt)~decimal_date,data=grn_ice_loss_with_NA,type='l',lty='dashed',col='red')

# saving!

pdf('figures/ice_mass_trends.pdf',width=7,height=5)
plot(mass_Gt~decimal_date,data=ant_ice_loss_with_NA,ylab="Ice Mass Loss (Gt)",xlab='Year',type='l',ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE)) + 
  lines((mass_Gt+2*sigma_Gt)~decimal_date,data=ant_ice_loss_with_NA,type='l',lty='dashed') + 
  lines((mass_Gt-2*sigma_Gt)~decimal_date,data=ant_ice_loss_with_NA,type='l',lty='dashed')+ 
  lines(mass_Gt~decimal_date,data=grn_ice_loss_with_NA,type='l',col='red') + 
  lines((mass_Gt+2*sigma_Gt)~decimal_date,data=grn_ice_loss_with_NA,type='l',lty='dashed',col='red') + 
  lines((mass_Gt-2*sigma_Gt)~decimal_date,data=grn_ice_loss_with_NA,type='l',lty='dashed',col='red')
dev.off()

# bar plot of total ice loss
ant_tot_ice_loss=min(ant_ice_loss$mass_Gt,na.rm=T)-max(ant_ice_loss$mass_Gt,na.rm=T)
grn_tot_ice_loss=min(grn_ice_loss$mass_Gt,na.rm=T)-max(grn_ice_loss$mass_Gt,na.rm=T)

barplot(height=c(ant_tot_ice_loss*(-1),grn_tot_ice_loss*(-1)),names.arg=c("Antarctica","Greenland"),ylim=c(0,5000),ylab="Ice Mass Loss (Gt)")
        