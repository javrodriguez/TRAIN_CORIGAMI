# functions
plotMat=function(data,start,end,max_distance,resolution){
  x=as.matrix(log(data[s:e,s:e]+1))
  x=rotateMatrix(x, -45)
  c=e/2
  x1=x[(c-max):c,]
  coord=paste0(chr,"_",start,"-",end)
  
  pdf(paste0("contact_hmap_",coord,".pdf"),width = 21, height = 3.3)
  print(pheatmap(x1,main=paste0("Coordinates: ",chr,":",start,"-",end," (bp); Max distance: ",max_distance, " (bp)"),
           cluster_rows = F,cluster_cols = F,
           show_rownames = F,show_colnames = F,
           inferno(10)))
  dev.off()
}

# libraries
library(pheatmap)
library(reticulate)
library(RColorBrewer)
library(viridis)
library(omnibus)

# Parameters
start = 1
end = 46000000
resolution = 10000
max_distance = 2000000 
chromosomes = c(paste0("chr",1:22))
options(scipen = 999)
np <- import("numpy")

for (chr in chromosomes){
  print(chr)
  # data reading
  file = paste0(chr,".npz")
  m <- np$load(file)
  N = length(m['0'])
  mat = matrix(data=0,nrow = N+1,ncol = N+1)

  # create matrix
  for (ii in as.character(m$files)){
    jv = m$f[[ii]]
    i = as.numeric(ii)
    for (j in 1:dim(jv)){
      if(i>=0){
        mat[j,i+j] = jv[j]
      }
      if(i<0){
        mat[abs(i)+j,j] = jv[j]
      }
    }
  }    
  M=as.data.frame(mat)

  # plot
  plotMat(M,start,end,max_distance,resolution)
}

