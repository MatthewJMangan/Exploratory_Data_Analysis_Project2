# Read in data
setwd("C:/Users/Matt/datasciencecoursera/EDA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset motor vehicle-related emissions in Baltimore City over time
mrg<-merge(NEI, SCC, by='SCC')
mrg_sub<-subset(mrg, type=="ON-ROAD" & fips=='24510')
index<-grep("vehicle", mrg_sub$Short.Name, ignore.case=TRUE)
mrg_sub<-mrg_sub[index,]

# make barplot showing motor-vehicle-related emissions in Baltimore City over time
png('plot5.png', width=640, height=480)
pm25sum<-with(mrg_sub, tapply(Emissions, year, sum))
barplot(pm25sum~as.numeric(names(pm25sum)), xlab='Year', 
        ylab=expression('Total PM'[2.5]*' Emissions (tons)'),
        main = expression('Total Motor Vehicle PM'[2.5]*' Emissions in Baltimore City over Time'))
dev.off()