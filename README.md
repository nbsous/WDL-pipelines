# WDL-pipelines
Stockpile of [WDL](https://software.broadinstitute.org/wdl/) pipelines for development and testing

### Needs description
Standalone methods for data processing which can be replicated easily on
multiple platforms including the University of Oslo Sensitive Data Services
[TSD](https://www.uio.no/english/services/it/research/sensitive-data/)
which are isolated from the internet.

## NGS_map_call_0.1

_Important note:_ when specifying paths to files in the .JSON config file, use of absolute
paths saves a great deal of pain, since cromwell runs within an obscure directory
structure.
