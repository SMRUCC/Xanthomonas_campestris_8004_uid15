**[Xanthomonas campestris pv. campestris 8004]** GCModeller genomics Modelling Project

> It is recommended that you can using this project as the GCModeller demo &amp; tutorials

### DataSource

+ NCBI genbank data: [Xanthomonas campestris pv. campestris str. 8004, complete genome](https://www.ncbi.nlm.nih.gov/nuccore/66571684/)
+ NCBI ftp directory:
+ RNA-seq data from public database:

### Directory Roadmap

+ **./genbank**: NCBI genbank annotation information
+ **[./genome](./genome)**: GCModeller genomics annotation result
   + ``./genome/circos/``: circos plot of the genome.
   + ``./genome/chromsome-map/``: chromsome map plot of the bacterial genome.
   + [``./genome/COG/``](./genome/COG/index.md): The COG annotation sbh result.
+ **[./pathway](./pathway)**: GCModeller Pathway network model
+ **[./proteome](./proteome)**:

### Data Figures

###### Xcc8004 genome function

![](./genome/COG/Xcc8004-COGs.COG.profiling.png)
![](./proteome/uniprot/GO/plot.png)

###### genome map plot

![](./thumbnails/map-part-A.png)
![](./thumbnails/map-part-B.png)

> View detail in [./genome/chromsome-map/](./genome/chromsome-map/)

###### promoter region palindrome cluster tree

[![](./thumbnails/promoter-palindrome-clusters.png)](./genome/palindrome-motifs/palindrome_promoter=-250bp-cut=0.65,minw=6/binary-net.cuts,quantile=0.99/tree.png)

## References

