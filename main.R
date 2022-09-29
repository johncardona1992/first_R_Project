# variable types
x<-c(0,0,1)
typeof(x) 
x<-c(TRUE,FALSE,TRUE)
typeof(x) 
x<-c("a","b")
typeof(x) 
x<-c(1+0i,2+1i)
typeof(x) 

#vector
x<-vector("numeric", length = 10)
typeof(x) 
x

#coersion
x<-0:10
x
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)

#list
x<-list("a",1,2+0i)
x

#Matrix

x<-matrix(data=0:5,nrow = 2,ncol = 3)
x
dim(x)
attributes(x)

#convert vector to matrix
x<-0:5
x
m<-matrix(data=x,nrow = 2, ncol = 3)
m
# bind vectors
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)