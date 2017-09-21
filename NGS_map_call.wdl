workflow NGS_map_call {
  String bam_file_repo
  String db_path
  String bam_detector_script

  call detectAvailableBamFiles {
    input:
      bamDirectory = bam_file_repo,
      dbPath = db_path,
      bamDetector = bam_detector_script
  }
}

### Find all bam files in bam repo and add with status "queued" in log DB
task detectAvailableBamFiles {
  String bamDetector
  String bamDirectory
  String dbPath
  command {
    Rscript NGS_map_call_0.1/resources/${bamDetector} ${bamDirectory} ${dbPath}
    NewlyAdded=sqlite3 ${dbPath} 'SELECT BamFilename FROM InputFiles WHERE ProcessStatus LIKE "Queued"'
  }
  output {
    String [Array] "${NewlyAdded}"

  }
}
