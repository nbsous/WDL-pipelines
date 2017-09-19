workflow NGS_map_call {
  String bam_file_repo
  String write_output_path
  String bam_detector_script


  call listAvailableBamFiles {
    input:
      bamDirectory = bam_file_repo,
      outputPath = write_output_path
      bamDetector = bam_detector_script
  }
}



####### TASKS #########


### Find all bam files in working directory and write list to output file.
task listAvailableBamFiles {
  String bamDirectory
  String outputPath

  command {
  Rscript resources/"${bamDetector}" "${bamDirectory}" "${outputPath}"

  }
  output {
	 File outputFile = "${outputPath}"
  }
}
