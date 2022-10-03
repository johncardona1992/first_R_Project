# variable types
x<-c(0,0,1)
typeof(x) 
x<-c(TRUE,FALSE,TRUE)
typeof(x) 
x<-c("a","b")
typeof(x) 
x<-c(1+0i,2+1i)
typeof(x) 

# vector
x<-vector("numeric", length = 10)
typeof(x) 
x

# coersion
x<-0:10
x
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)

# list
x<-list("a",1,2+0i)
x

# Matrix

x<-matrix(data=0:5,nrow = 2,ncol = 3)
x
dim(x)
attributes(x)

# convert vector to matrix
x<-0:5
x
m<-matrix(data=x,nrow = 2, ncol = 3)
m

# bind vectors
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

# factor
x<-factor(c("YES","NO","NO","YES"))
x
table(x)
unclass(x)
# set levels
x<-factor(c("YES","NO","NO","YES"), levels = c("YES","NO"))
x
unclass(x)

# missing values
x<-c(1,NA,NaN,2)
is.nan(x)
is.na(x)

# dataframe
df<-data.frame(nombre = c("a","b","c"), edad = c(23,34,32))
df
nrow(df)
ncol(df)

# subsetting
x<-1:10
x[1]
x[1:5]
u<-x>5
u
x[u]

# subsetting lists
x<-list(foo=c(1,2,3,4), bar=0.6)
x
x[1]
x[[1]]
x$bar
x$foo