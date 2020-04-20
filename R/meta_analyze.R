library(data.table)
library(metap)

#knn <- "10"
knn <- "05"

samples <- c("H0351_1009", "H0351_1012", "H0351_1015", "H0351_1016", "H0351_2001", "H0351_2002")
possible_ftd_genes <- c("C9ORF","GRN","MAPT")

ftd_gene <- "C9ORF"

base <- "../results/results_rankcor_"

myp <- c()
myw <- c()
for (sid in samples){
  fname <- paste(base, ftd_gene, "_", sid, "_knn", knn, "_geo_subj.csv.gz", sep="")
  tmp <- fread(paste("cat ", fname, " | gzip -d"), data.table=F)
  pv <- tmp$P
  w  <- sign(tmp$T)
  myp <- cbind(myp, pv)
  myw <- cbind(myw, w)
}
colnames(myp) <- samples
colnames(myw) <- samples

meta.res <- t(apply(cbind(myp, myw), 1, function(x){
  ttt <- sumz(p=x[1:6], weights=x[7:12])
  p2s <-pnorm(abs(ttt$z), lower.tail=F)/2
  return(c(ttt$z, p2s))
}))
colnames(meta.res) <- c("sumz", "metaP")

#combine with probe_info
pinfo <- read.csv("probes_for_analysis.csv", row.names=1, as.is=T)
ugene <- apply(pinfo, 1, function(x){
  unique(unlist(strsplit(x["Genes"],split=" ")[[1]]))
})
holm <- p.adjust(meta.res[,2], "holm" )
fdr  <- p.adjust(meta.res[,2], "fdr" )
result <- data.frame(probe_name=pinfo$probe_name, gene=ugene, meta.res, HOLM_P=holm, FDR_P=fdr)

ofname <- paste(base, ftd_gene, "_sumz_knn", knn, "_geo_subj.csv", sep="")
write.csv(result, ofname, quote=F)
