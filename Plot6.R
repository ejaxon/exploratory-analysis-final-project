# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
#    vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen
#    greater changes over time in motor vehicle emissions?

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

png(filename="./Plot6.png")

dev.off()

