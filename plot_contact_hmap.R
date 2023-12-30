# functions
plotMat=function(data,start,end,max_distance,resolution){
  # data=M
  # start=1
  # end=46000000
  # max_distance=2000000
  # resolution=resolution
  
  res=resolution
  s=ceiling(start/res)
  e=ceiling(end/res)
  max=max_distance/res
  
  x=as.matrix(log(data[s:e,s:e]+1))
  x=rotateMatrix(x, -45)
  c=e/2
  x1=x[(c-max):c,]
  coord=paste0(chr,"_",start,"-",end)
  png(paste0("contact_hmap_",coord,".png"),width = 1920, height = 240)
  pheatmap(x1,main=paste0("Coordinates: ",chr,":",start,"-",end," (bp); Max distance: ",max_distance, " (bp)"),
           cluster_rows = F,cluster_cols = F,
           show_rownames = F,show_colnames = F,
           inferno(10))
  dev.off()
}

# libraries
library(pheatmap)
library(reticulate)
library(RColorBrewer)
library(viridis)
library(omnibus)

# Parameters
file = "chr10.npz"
resolution = 10000
max_distance = 2000000 
chr = gsub(x = file,pattern = ".npz",replacement = "")
options(scipen=999)

# data reading
np <- import("numpy")
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
