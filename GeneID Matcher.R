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
blastRows <- readRows(getSheets(wb)[['BLAST_RESULTS']], 2, 17704, 1,  2)
access10 = getRows(goFilteredSheet, rowIndex=NULL)
goRows <- readRows(goFilteredSheet, 2, 91, 1, 9)

cell1 <- getCells(access10[1], colIndex = 9, simplify = TRUE)[[1]]
#setCellValue(cell1, value="Gene ID", richTextString = FALSE, showNA = TRUE)
i <- 0
for(x in goRows[,9]){
  i <- i +1
  matched <- FALSE
  j <- 0
  for(y in blastRows[,2]){
    if(matched){break}
    j <- j +1
    if(y == x){
      res <- strsplit(blastRows[j,1],".")
      res <- res[1]
      print(res)
      cell <- getCells(access10[i+1], colIndex= 9, simplify= TRUE)[[1]]
      setCellValue(cell, res, richTextString = FALSE, showNA = TRUE)
      matched <- TRUE
    }
  }
  
}
print(i)
saveWorkbook(wb, "C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Collagen_Mapped_Simple_Differences/Pisas_Collagen_IDMAP.xlsx", password = NULL)

