#!/usr/bin/env nextflow

params.sleep = 0 
params.monochrome_logs = false
params.fail = false
params.header = false

process sayHello {
  script:
    """
    echo "Hello world!"
    sleep $params.sleep
    exit ${params.fail ? 1 : 0}
    """
}

workflow {
  if( params.header )
    log.info nfcoreHeader()

  sayHello()
}

def nfcoreHeader() {
    // Log colors ANSI codes
    def c_reset = params.monochrome_logs ? '' : "\033[0m";
    def c_dim = params.monochrome_logs ? '' : "\033[2m";
    def c_black = params.monochrome_logs ? '' : "\033[0;30m";
    def c_green = params.monochrome_logs ? '' : "\033[0;32m";
    def c_yellow = params.monochrome_logs ? '' : "\033[0;33m";
    def c_blue = params.monochrome_logs ? '' : "\033[0;34m";
    def c_purple = params.monochrome_logs ? '' : "\033[0;35m";
    def c_cyan = params.monochrome_logs ? '' : "\033[0;36m";
    def c_white = params.monochrome_logs ? '' : "\033[0;37m";

    return """    -${c_dim}--------------------------------------------------${c_reset}-
                                            ${c_green},--.${c_black}/${c_green},-.${c_reset}
    ${c_blue}        ___     __   __   __   ___     ${c_green}/,-._.--~\'${c_reset}
    ${c_blue}  |\\ | |__  __ /  ` /  \\ |__) |__         ${c_yellow}}  {${c_reset}
    ${c_blue}  | \\| |       \\__, \\__/ |  \\ |___     ${c_green}\\`-._,-`-,${c_reset}
                                            ${c_green}`._,._,\'${c_reset}
    ${c_purple}  nf-core/rnaseq v${workflow.manifest.version}${c_reset}
    -${c_dim}--------------------------------------------------${c_reset}-
    """.stripIndent()
}
