#!/usr/bin/env nextflow
echo true
params.sleep = 0 
params.monochrome_logs = false
params.fail = false

log.info nfcoreHeader()

cheers = Channel.from 'Bonjour'

process sayHello {
  input: 
    val x from cheers
  script:
    """
    echo '$x world!'
    sleep $params.sleep
    exit ${params.fail ? 1 : 0}
    """
}


def nfcoreHeader() {
    // Log colors ANSI codes
    c_reset = params.monochrome_logs ? '' : "\033[0m";
    c_dim = params.monochrome_logs ? '' : "\033[2m";
    c_black = params.monochrome_logs ? '' : "\033[0;30m";
    c_green = params.monochrome_logs ? '' : "\033[0;32m";
    c_yellow = params.monochrome_logs ? '' : "\033[0;33m";
    c_blue = params.monochrome_logs ? '' : "\033[0;34m";
    c_purple = params.monochrome_logs ? '' : "\033[0;35m";
    c_cyan = params.monochrome_logs ? '' : "\033[0;36m";
    c_white = params.monochrome_logs ? '' : "\033[0;37m";

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
