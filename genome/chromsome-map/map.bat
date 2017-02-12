# Generates the config file template and you can edit it in notepad++
# MapPlot /Config.Template /out "./config.inf"
MapPlot --Draw.ChromosomeMap.genbank /gb "../../genbank/CP000050.1.txt" /conf "./config.inf" /out "./" /COG "../COG/Xcc8004-COGs.csv"