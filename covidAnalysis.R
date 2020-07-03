#Webscraping
#Analyzing covid Data
library(xml2)
library(rvest)
url<-read_html("https://en.wikipedia.org/wiki/2020_coronavirus_pandemic_in_India")
tbls <- html_nodes(url, "table")
head(tbls)
tabledata1 <- url %>% html_nodes("table") %>%.[3] %>%html_table(fill = TRUE)
str(tabledata1)
View(tabledata1[[1]])
#Webscraping the main table of information
tableData4 <- url %>% html_nodes("table") %>%.[4] %>%html_table(fill = TRUE)
str(tableData4)
View(tableData4[[1]])
cdata<-tableData4[[1]]
cdata[[1]]<-as.numeric(cdata[[1]])
cdata[[3]]<-as.numeric(cdata[[3]])
cdata[[4]]<-as.numeric(cdata[[4]])
cdata[[5]]<-as.numeric(cdata[[5]])
cdata[[6]]<-as.numeric(cdata[[6]])
str(cdata)
View(cdata)
cdata<-data.frame(Sno=cdata[[1]],State_UT=cdata[[2]],TotalCases=cdata[[3]],Deaths=cdata[[4]],Recoveries=cdata[[5]],ActiveCases=cdata[[6]])
str(cdata)
cdata<-cdata[-1,]
View(cdata)
cdata<-cdata[-nrow(cdata),]
View(cdata)
cdata<-cdata[-nrow(cdata),]
View(cdata)
cdata<-cdata[-nrow(cdata),]
View(cdata)
attach(cdata)

x=State_UT
y=TotalCases
library(ggplot2)
barplot(y,names.arg = x,col="red")
ggplot(cdata,mapping = aes(x=reorder(State_UT,-TotalCases),y=TotalCases))+geom_col(position = "dodge",alpha=0.8)+coord_flip()+labs(title = "Total covid cases state wise in India",y="Total Covid Cases",x="State/Union Territory")

