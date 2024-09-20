library(readxl)
library(dplyr)

questions <- read_excel("L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/A Source documents/iDPS - Variable list/DPS Variable Overview - for summary.xlsx")
questions <- questions %>% select(`Variable name`, Question, NL, FIN, FR, JPN, SWE)
questions <- questions %>%
  mutate(across(NL:SWE, ~ coalesce(. == "x", FALSE))) %>%  # Convert 'x' to TRUE and NA/other values to FALSE
  rename(Variable = `Variable name`, Question_Text = Question)  # Rename 'Question' column to 'variable'

write.csv(questions, "L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/A Source documents/iDPS - Variable list/questions.csv", row.names = F)