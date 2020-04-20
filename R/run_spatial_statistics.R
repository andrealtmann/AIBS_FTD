#! /usr/local/bin/Rscript
#This is a wrapper script for spatial_statistics.R

possible_samples <- c("H0351_1009", "H0351_1012", "H0351_1015", "H0351_1016", "H0351_2001", "H0351_2002")
possible_ftd_genes <- c("C9ORF","GRN","MAPT")

remotely <- T
sid <- ""

#read comman line
args = commandArgs(trailingOnly=TRUE)
for (ar in args){
  tok = strsplit(ar, split="=")[[1]]

  if (tok[1] == "--gene"){
    if (is.element(tok[2], possible_ftd_genes)){
      ftd_gene <- tok[2]
    } else {
       message("GENE ", tok[2], " is not a valid option.")
       q("no",status=-1)
    }
  }

  if (tok[1] == "--subj"){
    if (is.element(tok[2], possible_samples)){
      sid <- tok[2]
    } else {
       message("subjectID '", tok[2], "' is not a valid option.")
       q("no",status=-1)
    }
  }
}

source("./spatial_statistics.R")
