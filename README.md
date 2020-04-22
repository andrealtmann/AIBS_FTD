# AIBS_FTD
Concordance analysis of atrophy in FTD and regional gene expression

A pre-print describing the analysis and a prior version of the pipeline and the results can be accessed through bioRxiv:
https://www.biorxiv.org/content/10.1101/2019.12.11.872143v1

To prepare the data, first run the two jupyer notebooks. This requires the gene expression data from the
Allen Institute, available here:
http://human.brain-map.org/static/download

The other bit required are updated (or improved) MNI coordinates. E.g., the ones provided by
Chris Gorgolewski and available here: https://github.com/chrisgorgo/alleninf/tree/master/alleninf/data

1) AIBS_sample_preprocessing.ipynb
This script selects the eligbile samples for the analysis.

2) AIBS_probe_selection.ipynb
This script selects the eligible gene expression probes for the analysis.

3) Coordinates to values.ipynb
This script obtains the t-value for a given MNI coordinate. Has to be run once for each of the FTD genes.

4) labels_to_neighbors.ipynb
Builds neighborhood graphs that are to be used for adjusting for the spatial autocorrelation in the correlation analysis.

Once the neighborhood graphs have been built. The correlation analysis can be run.
This is done using the R-script:
run_spatial_statistics.R
the option --gene is used to define the FTD gene to run the analysis for (e.g., --gene=MAPT)
the option --subj is used to define the brain donor. If no donor is provided then the analysis
is run by merging all subjects' data.

The script meta_analyze.R is used to combine the single results for each brain donor into one meta P-value.



