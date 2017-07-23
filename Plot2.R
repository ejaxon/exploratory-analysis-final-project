# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶")
#    from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("./summarySCC_PM25.rds")

bc <- subset(NEI, fips==24510) # Get Baltimore City

total <- tapply(bc$Emissions, bc$year, sum)/1000 # Scale to Kilotons
png(filename="./Plot2.png")
barplot(total, main="Total Baltimore City PM2.5 Emissions (Kilotons)", xlab="Year", ylab="Total PM2.5 Emissions (Kilotons)", ylim=c(0,4))
dev.off()

