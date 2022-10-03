df<-read.csv(file = "hw1_data.csv")
nrow(df)
head(df)
tail(df)
df<-df[!is.na(df$Ozone),]
df2<-df[df$Month == 5, ]
df2
max(df2$Ozone)
