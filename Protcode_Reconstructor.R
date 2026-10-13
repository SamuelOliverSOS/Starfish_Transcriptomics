#gets traditionally formatted prot IDs post Uniprot and GO filtration 
library(xlsx)
library(xlsxjars)
library(rJava)
library(readxl)
javaImport(packages = "org.appache.poi")
.jinit()
wb <- loadWorkbook("C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Collagen_Mapped_Simple_Differences/Pisas_Collagen_IDMAP.xlsx")
goFilteredSheet <- getSheets(wb)[['GO_Filtered']]
access9 = getRows(goFilteredSheet, rowIndex=NULL)
print(access9[1])
rows <- readRows(goFilteredSheet, 2, 91, 1, 9)
i <- 0
for(x in rows[,1]){
  i = i + 1
  res <- paste0("sp|", x,"|",rows[i,3])
  cell <- getCells(access9[i+1], colIndex= 9, simplify= TRUE)[[1]]
  setCellValue(cell, res, richTextString = FALSE, showNA = TRUE)
}
print(i)
saveWorkbook(wb, "C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Collagen_Mapped_Simple_Differences/Pisas_Collagen_IDMAP.xlsx", password = NULL)

