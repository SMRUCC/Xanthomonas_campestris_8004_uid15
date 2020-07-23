imports ["annotation.genbank_kit", "annotation.genomics"] from "seqtoolkit";

# script for create genomics context table file
# apply for the comparative_genomics analysis
# like operon prediction, etc.

# setting data source and table output
const bacterials_repo as string = "K:\bacterials";

let genbank_gz as string = list.files(bacterials_repo, pattern = "*.gz");
let redump_context as function(gbff.gz) {

	let contextTable as string = `${bacterials_repo}/contextDb/${basename(gbff.gz)}.PTT`;

	if (!file.exists(contextTable)) {
		# read a single gbff gzip compressed file
		# and then populate all of the genomics
		# context data objects from the given genbank
		# data
		using gbff as open.gzip(gbff.gz) {
			let genbank = gbff 
			:> populate.genbank 
			:> as.vector
			;
		
			genbank[!is.plasmid(genbank)]
			:> as.PTT
			:> write.PTT_tabular(file = contextTable)
			;
		}
	} else {
		print(`skip of the re-dump context data: ${basename(contextTable)}`);
	}
}

print(`we have ${length(genbank_gz)} genbank data files:`);
print(basename(genbank_gz));

# run pipeline and then save the data table
genbank_gz :> sapply(redump_context);
