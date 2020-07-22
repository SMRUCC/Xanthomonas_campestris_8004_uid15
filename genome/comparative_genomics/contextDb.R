imports ["annotation.genbank_kit", "annotation.genomics"] from "seqtoolkit";

# script for create genomics context table file
# apply for the comparative_genomics analysis
# like operon prediction, etc.

# setting data source and table output
const bacterials_repo as string = "K:\bacterials";
const context_table as string   = "K:\bacterials_bundleAll.txt";

let genbank_gz as string = list.files(bacterials_repo, pattern = "*.gz");
let read_context as function(gbff.gz) {

	# read a single gbff gzip compressed file
	# and then populate all of the genomics
	# context data objects from the given genbank
	# data
	using gbff as open.gzip(gbff.gz) {
		gbff 
		:> populate.genbank 
		:> projectAs(genome.genes) 
		:> unlist(typeof = "gene_info", pipeline = TRUE) 
		;
	}
}

print(`we have ${length(genbank_gz)} genbank data files:`);
print(basename(genbank_gz));

# run pipeline and then save the data table
genbank_gz
:> projectAs(read_context)
:> unlist(typeof = "gene_info", pipeline = TRUE) 
:> write.PTT_tabular(file = context_table)
;