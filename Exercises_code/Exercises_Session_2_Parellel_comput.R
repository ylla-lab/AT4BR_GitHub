library(parallel)


# 10 cols with 50milion values each
num_elements=5e7
df<-data.frame(
  column1=rnorm(num_elements, mean=20,sd=5),
  column2=rnorm(num_elements, mean=2,sd=1),
  column3=rnorm(num_elements, mean=55,sd=2),
  column4=rnorm(num_elements, mean=89,sd=91),
  column5=rnorm(num_elements, mean=44,sd=5),
  column6=rnorm(num_elements, mean=33,sd=15),
  column7=rnorm(num_elements, mean=525,sd=1),
  column8=rnorm(num_elements, mean=395,sd=12),
  column9=rnorm(num_elements, mean=1000,sd=88),
  column10=rnorm(num_elements, mean=5665,sd=10)
)

head(df)
dim(df)

# single thread lapply()
t0<-system.time(c(#elapsed = time to execute the function / User CPU time = CPU time spent by the current process /system CPU time = CPU time spent by by the kernel (OS) on behalf of the current process. 
  dfmeans<-lapply(df, FUN=mean), 
  dfmin<-lapply(df, FUN=min) ,
  dfmax<-lapply(df, FUN=max) 
  ))

t0

cbind(dfmeans,dfmin, dfmax)

# mclapply 1 core
t1<-system.time(c(
  dfmeans_1<-mclapply(df, FUN=mean, mc.cores = 1), 
  dfmin_1<-mclapply(df, FUN=min, mc.cores = 1) ,
  dfmax_1<-mclapply(df, FUN=max, mc.cores = 1) 
))

t1
cbind(dfmeans_1,dfmin_1, dfmax_1)


# mclapply 2 core
t2<-system.time(c(
  dfmeans_2<-mclapply(df, MARGIN=2, FUN=mean, mc.cores = 2), 
  dfmin_2<-mclapply(df, MARGIN=2, FUN=min, mc.cores = 2) ,
  dfmax_2<-mclapply(df, MARGIN=2, FUN=max, mc.cores = 2) 
))

t2
cbind(dfmeans_2,dfmin_2, dfmax_2)


# mclapply 4 core
t3<-system.time(c(
  dfmeans_3<-mclapply(df, MARGIN=3, FUN=mean, mc.cores = 4), 
  dfmin_3<-mclapply(df, MARGIN=3, FUN=min, mc.cores = 4) ,
  dfmax_3<-mclapply(df, MARGIN=3, FUN=max, mc.cores = 4) 
))

t3
cbind(dfmeans_3,dfmin_3, dfmax_3)



time_df<-data.frame(
  test=as.factor(c("1core","1core2","2core","4core")),
  times=c(t0[1], t1[1], t2[1], t3[1])
  )

plot(x=time_df$test, y=time_df$times,ylab="seconds")

