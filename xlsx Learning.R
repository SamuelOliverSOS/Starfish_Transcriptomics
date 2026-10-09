library(xlsx)
library(xlsxjars)
library(rJava)
library(readxl)
options(java.parameters = "-Xss4m")
javaImport(packages = "org.appache.poi")
.jinit()
sheet <- getSheets(loadWorkbook("C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Derm_Augustus_Collagen _Inquiry_Mapped_Practice copy.xlsx"))[['Sheet0']] #all genes/proteins resulting from GO search
colGenes <- readRows(sheet, startRow = 2, endRow = 73, startColumn = 1, endColumn = 10 )
geneExpressionsWB <- loadWorkbook("C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Tester.xlsx")
geneExpressionsSheets <- getSheets(geneExpressionsWB)
geneExpressionsMain <- geneExpressionsSheets[['Sheet1']]
gExpressionLevels <- readRows(geneExpressionsMain, startRow = 2 , endRow = NULL, startColumn = 1, endColumn = 25)
i <- 0
location <- 1
for(x in colGenes[,10]){ #going down the chart, x is the full prot ID
  }
  i <- i + 1
  colStats <- readColumns(sheet, startColumn = 9, endColumn = 9, startRow = i, endRow = i + 1)
    for(g in gEC){
      # this searches for the gene ID within the expression level matrix, I am also able to find out wether or not it was found using this 
      location <- location + 1
      if(g == x){
        print("found")
        createSheet(geneExpressionsWB, sheetName = x)
        saveWorkbook(geneExpressionsWB,"C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Tester.xlsx", password = NULL)
        if(i %% 2 == 0){
          rows <- createRow(geneExpressionsSheets[[x]], 1:13) # 9 rows when working with tester, 12 in real deal
          cell <- createCell()
          
        }
    
    }
  }
  print(s)
print(i)

