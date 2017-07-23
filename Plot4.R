# 4. Across the United States, how have emissions from coal combustion-related sources changed
#    from 1999–2008?

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

scc.coalcomb<- subset(SCC, grepl(".*[Cc]oal.*", EI.Sector))
scc.coalcomb$SCC <- factor(scc.coalcomb$SCC) # Recompute factor levels
scc.coalcomb$EI.Sector <- factor(scc.coalcomb$EI.Sector) # Recompute factor levels

png(filename="./Plot4.png")

dev.off()

