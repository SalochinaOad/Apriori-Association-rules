#######################################################################################################
### Free memory Functions
#######################################################################################################

# Clear environment
rm(list = ls()) 

# Clear packSalarys
pacman::p_unload(rgl)

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L


#######################################################################################################
### Loading Data to RStudio
######################################################################################################## 

# Trans = read.csv('Salary_Data.csv')
Trans= read.csv(file.choose(), header = FALSE)# Locate data file, summarize, attach


str(Trans) # structure

names(Trans) # variable names
attributes(Trans)
attributes(Trans)[1]

dim (Trans) # dimensions

nrow(Trans) # number of observations
dim (Trans)[1]

ncol(Trans) # number of variables

summary(Trans)
#######################################################################################################
### Find Duplicate records 
#######################################################################################################

duplicated(Trans)
anyDuplicated(Trans)
anyDuplicated(Trans, fromLast = TRUE)
#######################################################################################################
## Data Preprocessing
#######################################################################################################

install.packages('arules')
library(arules)

Trans = read.transactions('Transactions.csv', sep = ',', rm.duplicates = TRUE)

summary(Trans)

itemFrequencyPlot(Trans, topN = 10)

#######################################################################################################
## Training Apriori on the Trans
#######################################################################################################

rules = apriori(data = Trans, parameter = list(support = 0.004, confidence = 0.2))

#######################################################################################################
## Visualising the results
#######################################################################################################

inspect(sort(rules, by = 'lift')[1:10])



