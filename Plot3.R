# 3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
#    which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#    Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
#    a plot answer this question.

require(plyr)
require(ggplot2)
NEI <- readRDS("./summarySCC_PM25.rds")

# Get Baltimore City, only the year, type and Emissions
bc <- subset(NEI, fips==24510)[4:6]

# Reduce to get just the total emissions, scaled to Kilotons
s <- ddply(bc, .(year, type), summarize, total=sum(Emissions)/1000)

p <- ggplot(data=s, mapping=aes(year,total)) + geom_point(shape=20,size=4) + ylim(c(0,3))
p <- p+facet_grid(. ~ type)
p <- p + geom_smooth(method="lm", se=FALSE)
p <- p + xlab("Year") + ylab("Total PM2.5 Emissions (Kilotons)")
p <- p + ggtitle("Total PM2.5 Emissions By Source Type (Kilotons)")
ggsave("./Plot3.png", device="png")

