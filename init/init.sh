# All rights reserved.

. init/logbot/logbot.sh
. init/utils.sh
. init/checks.sh

trap handleSigTerm TERM
trap handleSigInt INT
trap 'echo hi' USR1

initExtremis() {
    printLogo
    assertPrerequisites
    sendMessage "Initializing Extremis ..."
    assertEnvironment
    editLastMessage "Starting Extremis ..."
    printLine
}

startExtremis() {
    startLogBotPolling
    runPythonModule Extremis "$@"
}

stopExtremis() {
    sendMessage "Exiting Extremis ..."
    endLogBotPolling
}

handleSigTerm() {
    log "Exiting With SIGTERM (143) ..."
    stopExtremis
    exit 143
}

handleSigInt() {
    log "Exiting With SIGINT (130) ..."
    stopExtremis
    exit 130
}

runExtremis() {
    initExtremis
    startExtremis "$@"
    local code=$?
    stopExtremis
    return $code
}
