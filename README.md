# AIBS_FTD
Concordance analysis of atrophy in FTD and regional gene expression

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

