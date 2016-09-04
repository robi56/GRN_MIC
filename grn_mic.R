
#Thesis "Gene Regulatory Network Inference using Maximal Information Coefficeint"
# By  S. M Amran (0907012) and Rabindra Nath Nandi(0907056)
# Supervised by Prof. Dr. Md. Aminul Haque Akand
# Department of CSE, Khulna University of Engineering and Technology , Bangladesh 

# This code is written in R language

********************............File Processing...........****************************** 

#read the gene expression for Yeast 10, 50, 100 genes
dream10<-read.csv("J:\\MIC\\data\\Dream3\\Yeast10\\Y10.csv",header=T)
dream50<-read.csv("J:\\MIC\\data\\Dream3\\Yeast50\\Y50.csv",header=T)
dream100<-read.csv("J:\\MIC\\data\\Dream3\\Yeast100\\Y100.csv",header=T)


#read The True Table of Gene Regulation Yeast 10.50,genes 100
true10<-read.table("J:\\\\MIC\\src\\res\\True10.txt",header=F)
true10<-as.matrix(true10)
true50<-read.table("J:\\MIC\\src\\res\\True50.txt",header=F)
true50<-as.matrix(true50)
true100<-read.table("J:\\MIC\\src\\res\\True100.txt",header=F)
true100<-as.matrix(true100) 

#read the gene expression for Noise 1,2,3
n1<-read.csv("J:\\MIC\\data\\Noise\\Noise1\\Noise1.csv",header=T,sep="\t")
n2<-read.csv("J:\\MIC\\data\\Noise\\Noise2\\Noise2.csv",header=T,sep="\t")
n3<-read.csv("J:\\MIC\\data\\Noise\\Noise3\\Noise3.csv",header=T,sep="\t")

#read The True Table of Gene Regulation NOisy Data 
t1<-read.csv("J:\\MIC\\data\\Noise\\Noise1\\True.txt",header=F)
t1<-as.matrix(t1)
t2<-read.csv("J:\\MIC\\data\\Noise\\Noise2\\True.txt",header=F)
t2<-as.matrix(t2)
t3<-read.csv("J:\\MIC\\data\\Noise\\Noise3\\True.txt",header=F)
t3<-as.matrix(t3)

#read the real Gene Expression Data
sosdata<-read.csv("J:\\MIC\\data\\SOS\\SOS.csv",header=T)
sosdata<-as.matrix(sosdata)
truenet<-read.csv("J:\\MIC\\data\\SOS\\True.csv",header=T)
truenet<-as.matrix(truenet)

**********************...........Implementation............***************************
  #Library 
  
library(minet)
library(energy)
library(minerva)

  # initialization for input data and true network (if data= dream10 then tnet= true10 , if data= sosdata then tnet= truenet)   
  data = dream10 or dream50 or dream100 or noise1 or noise2 or noise3 or sosdata
  tnet = true10 or true50 or true100 or t1 or t2 or t3 or truenet
   
# An example for Dream10 data with correspinding  true network for 10 genes 
  
 #MRNET-MIC , MRNET and MRNET -MICR2 Algortihm 
data = dream10  #gene data 
tnet= true10    #real Network 
mi1<-build.mim(data) #take mutual information 
mic1=mine(data)   #Calculate the MINE Statistics outputs where MIC,MICR2 included
mi=mrnet(mi1)  #apply MRNET to mututal Information 
mic=mrnet(mic1$MIC)  #apply MRNET to maximal information coeffiecient 
gmic=mrnet(mic1$MICR2) #apply MRNET to (maximal information coeffiecient - peasrson coefficeint) 
mi.tbl=validate(mi,tnet)  #validate the infered network mi with true network tnet.
mic.tbl=validate(mic,tnet)
gmic.tbl=validate(gmic,tnet)

auc.roc(mi.tbl)     # calculate roc value for confusion matrix mi.tbl
auc.roc(mic.tbl)
auc.roc(gmic.tbl)
auc.pr(mi.tbl)   # calculate pr value for confusion matrix mi.tbl
auc.pr(mic.tbl)
auc.pr(gmic.tbl)


#CLR-MIC , CLR and CLR -MICR2 Algortihm 
data = dream10  #gene data 
tnet= true10    #real Network 
mi1<-build.mim(data) #take mutual information 
mic1=mine(data)   #Calculate the MINE Statistics outputs where MIC included
mi=mrnet(mi1)  #apply CLR to mututal Information 
mic=mrnet(mic1$MIC)  #apply CLR to maximal information coeffiecient 
gmic=mrnet(mic1$MICR2) #apply CLR to (maximal information coeffiecient - peasrson coefficeint) 
mi.tbl=validate(mi,tnet)  #validate the infered network mi with true network tnet.
mic.tbl=validate(mic,tnet)
gmic.tbl=validate(gmic,tnet)

auc.roc(mi.tbl)     # calculate roc value for confusion matrix mi.tbl
auc.roc(mic.tbl)
auc.roc(gmic.tbl)
auc.pr(mi.tbl)   # calculate pr value for confusion matrix mi.tbl
auc.pr(mic.tbl)
auc.pr(gmic.tbl)

# Figure Ploting 

#Figure 

length.txt=c('MRNET','MRNET-MIC','MRNET-MICR2')
length.txt1=c('CLR','CLR-MIC','CLR-MICR2')
leg.col=c('green','blue','red')

#Figure for MRNET (After executing  the MRNET algorthim this section should be executed to obtain the figure for MRNET algortihm )
dev <- show.roc(mi.tbl, col="green", type="l")
dev <- show.roc(mic.tbl, device=dev, col="blue", type="l")
show.roc(gmic.tbl, device=dev, col="red",type="l")
legend(.66,.25,leg.txt1,pch = 1,cex=0.6,col=leg.col,pt.cex = 1)

#Figure fro CLR(After executing  the CLR algorthim this section should be executed to obtain the figure for MRNET algortihm )
dev <- show.pr(mi.tbl, col="green", type="l")
dev <- show.pr(mic.tbl, device=dev, col="blue", type="l", )
show.pr(gmic.tbl, device=dev, col="red",type="l")
legend(.5,.40,leg.txt1,pch = 1,cex=0.8,col=leg.col,pt.cex = 1)



