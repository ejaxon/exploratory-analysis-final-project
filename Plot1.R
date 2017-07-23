# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base
#    plotting system, make a plot showing the total PM2.5 emission from all sources for each of the
#    years 1999, 2002, 2005, and 2008.

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
total <- tapply(NEI$Emissions, NEI$year, sum)/1000000 # Scale to Megatons
png(filename="./Plot1.png")
barplot(total, main="Total U.S. PM2.5 Emissions (Megatons)", xlab="Year", ylab="Total PM2.5 Emissions (Megatons)", ylim=c(0,8))
dev.off()



