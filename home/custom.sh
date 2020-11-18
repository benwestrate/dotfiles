#!/bin/bash

# ================================
# JAVA Env Comfigs
# ================================
#defaultJavaVersion='j8'

#alias j12="export JAVA_HOME=`/usr/libexec/java_home -v 12`; java -version"
#alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
#alias j10="export JAVA_HOME=`/usr/libexec/java_home -v 10`; java -version"
#alias j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
#alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
#alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"

#j8

# ================================
# My Env Alias's
# ================================
alias please="sudo !!"

# ================================
# My Env Functions
# ================================
function repos() {
    cd $HOME/Developer/repos/$1
}

# ================================
# AEM Commands
# ================================
alias            aem-build="mvn clean install -PautoInstallPackage -T2"
alias        aem-build-pub="mvn clean install -PautoInstallPackagePublish -T2"
alias              aem-pid="ps -ef | grep java"
alias              aem-fed="aemfed -t \"http://admin:admin@localhost:4502\" -w \"ui.apps/src/main/content/jcr_root/\""

# ================================
# Docker Compose -- Functions's
# ================================
function dc() {
    docker-compose $1
}

# $1 is the name of the running container
function dcbash(){
    docker-compose exec $1 /bin/bash
}

# ================================
# Docker Compose -- Alias's
# ================================
alias dcstart="dc start"
alias dcstop="dc stop"


alias reload=". ~/.zshrc"

alias python=/usr/local/bin/python3

alias preCommit="make lint-js-all && make prettier && make lint-svg"

alias bvt="WORKERS=4 make bvt-local-quiet"