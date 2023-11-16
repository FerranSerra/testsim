mkdir -p res/genome
wget -O res/genome/ecoli.fasta.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz


gunzip res/genome/ecoli.fasta.gz

#indexig
 echo "Running STAR index..."
   mkdir -p res/genome/star_index
   STAR --runThreadN 4 --runMode genomeGenerate --genomeDir res/genome/star_index/ --genomeFastaFiles res/genome/ecoli.fasta --genomeSAindexNbases 9
    echo

#do for every data

#for i in $(ls /home/vant/Máster Bioinformática/LinuxAvanzado/testsim/testsim/data/*.fastq.gz | cut -d'_' -f1 | sed "s:data/::" | sort | uniq)
#	 do
#		 echo bash scripts/analyse_sample.sh $i 
#	 done
	 
	 
	 for i in $(ls /home/vant/MásterBioinformática/LinuxAvanzado/testsim/testsim/data/*.fastq.gz | cut -d'_' -f1 | awk -F"data/" '{print $2}' | sort | uniq)
	 do
		  bash scripts/analyse_sample.sh $i 
	 done
	 
	 
	 #for i in $(ls /home/vant/MásterBioinformática/LinuxAvanzado/testsim/testsim/data/*.fastq.gz | cut -d'_' -f1 | awk -F"data/" '{print $2}' | sort | uniq); do echo $i; done;
