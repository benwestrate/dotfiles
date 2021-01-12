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
# B5 Commands
# ================================
alias        1p="cd ~/go/src/go.1password.io/b5"
alias preCommit="make lint-js-all && make prettier && make lint-svg && make lint-sass-all"
alias       bvt="WORKERS=3 make bvt-local"
alias       hot="make run-frontend-proxy-server"
alias    hotall="make run-frontend-proxy-server-all"
alias   b5serve="make clean all && make run-server"

alias preCommit2="parallelizeEsLint && make prettier && make lint-svg && make lint-sass-all"
alias    hot-off="rm ~/.b5app/hotreloading.env"
alias     hot-on="cp ~/Developer/benwestrate/hotreloading.env ~/.b5app"

function hotStatus() {
    FILE=~/.b5app/hotreloading.env
    if test -f "~/.b5app/hotreloading.env"; then echo "ON"; else echo "OFF"; fi
}

function parallelizeEsLint() {
    cd /Users/ben/go/src/go.1password.io/b5
    esLintPaths=(
        "cd client/src/vendor/onepassword && ./node_modules/.bin/eslint . --quiet --cache"
        "cd client/src/vendor/web-workers && ./node_modules/.bin/eslint . --quiet --cache"
        "cd client/src/js/app && ../../node_modules/.bin/eslint . --quiet --cache --fix"
        "cd client/src/tests && ../node_modules/.bin/eslint . --quiet --cache"
        "cd client/src/key_reset_tests && ../node_modules/.bin/eslint . --quiet --cache"
        "cd bvt && ./node_modules/.bin/eslint . --quiet --cache"
        "cd scripts/team-builder && ./node_modules/.bin/eslint . --quiet --cache"
        "cd client/src/vendor/test-rite && ./node_modules/.bin/eslint . --quiet --cache"
    )
    concurrently $esLintPaths
}

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

# ================================
# Git -- Alias's
# ================================

alias gc="git ci"

. $curr/home/mute_status.sh