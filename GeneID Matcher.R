#gets basemeans using protein codes, I will probably change this to just use the BLAST workbook in future versions, this was faster in this instance.
library(xlsx)
library(xlsxjars)
library(rJava)
library(readxl)
options(java.parameters = "-Xss4m")
javaImport(packages = "org.appache.poi")
.jinit()
wb <- loadWorkbook("C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Collagen_Mapped_Simple_Differences/Pisas_Collagen_IDMAP.xlsx")
goFilteredSheet <- getSheets(wb)[['GO_Filtered']]
blastRows <- readRows(getSheets(wb)[['BLAST_RESULTS']], 2, 12871, 1,  2)
access10 = getRows(goFilteredSheet, rowIndex=NULL)
goRows <- readRows(goFilteredSheet, 2, 73, 1, 10)

i <- 0
for(x in goRows[,9]){
  i <- i +1
  matched <- FALSE
  j <- 0
  for(y in blastRows[,2]){
    if(matched){break}
    j <- j +1
    if(y == x){
      res <- blastRows[j,1]
      print(res)
      cell <- getCells(access10[i+1], colIndex= 10:10, simplify= TRUE)[[1]]
      setCellValue(cell, res, richTextString = FALSE, showNA = TRUE)
      matched <- TRUE
    }
  }
  
}
print(i)
saveWorkbook(wb, "C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Derm_Augustus_Collagen _Inquiry_Mapped_Practice copy.xlsx", password = NULL)

