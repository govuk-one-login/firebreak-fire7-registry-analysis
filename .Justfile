#
set shell := ["bash", "-uc"]
set dotenv-load
name := "Paul Dougan"

alias b:= build
alias c := choose
alias d := data
alias e := explore
alias g := graph
alias h := help
alias i := issues
alias j := jira
alias p := powerpoint
alias r := repo
alias s := sharepoint
alias v := versions
alias w := wiki

default: help

viz-registry:
    @qsv viz smart --smarter --title "Visualise data/raw/registry.csv" --cols visibility data/raw/registry.csv --open www/qsv-raw-registry-analysis --open 

# build 
build:
    @make clean
    @make
    @tree data

# choose recipe
choose:
    @just --choose

# launch coding IDE
code:
    @code .

# open data
data:
    @open data

# display sharepoint
sharepoint:
    @open "https://beisgov.sharepoint.com/sites/Rponboardengage/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FRponboardengage%2FShared%20Documents%2FGeneral%2FOnboarding%20Technical%20Architects%2FFirebreaks%2FFIRE%2D7%20%2D%20analyse%20client%20registry&viewid=4efb35ea%2Dcf26%2D445b%2Db778%2Da40009b6f844"

# explore the data
explore:
    @uvx visidata data

# display the graph of make dependencies
graph:
    @clear
    @make -Bnd | makefile2dot --direction LR  | dot -Tpng -Gfontname=Helvetica | imgcat    

# help
help:
    @just --list

# list issues
issues:
     @gh issue list

# open jira story
jira:
    @open "https://govukverify.atlassian.net/browse/FIRE-7"

# open powerpoint
powerpoint:
    @open "https://beisgov.sharepoint.com/:p:/r/sites/Rponboardengage/_layouts/15/Doc.aspx?sourcedoc=%7B04943329-887A-4023-B537-ADAA3F1A67C0%7D&file=FIRE7%20-%20presentation.pptx&action=edit&mobileredirect=true&wdslf=spodoclib-c&wdwpf=doclib-c"

# display repository on GitHub
repo:
    @gh repo view --web 

# display system informstion
system-info:
    @echo "{{ arch() }} {{ os_family() }} {{ os() }}"

# display versions
versions:
    @echo "bash: `bash --version | head -n 1`"
    @echo "docopts: `docopts --version | head -n 1`"
    @echo "dot: `dot --version`"
    @echo "gsed: `gsed --version | head -n 1`"
    @echo "jaq: `jaq --version`"
    @echo "jq: `jq --version`"
    @echo "just: `just --version`"
    @echo "lms: `lms --version`"
    @echo "make: `make -v | head -n 1`"
    @echo "pandoc: `pandoc --version | head -n 1`"
    @echo "qsv: `qsv --version | gsed 's/;.*$//'`"
    @echo "repomix: `repomix --version`"
    @echo "toon: `toon --version`"
    @echo "vd: `vd -v`" 

# Wiki page
wiki:
    @open "https://govukverify.atlassian.net/wiki/spaces/ON/pages/7156924435/FIRE-7+2026-11+Firebreak+-+Analysis+of+client+registry"

set unstable
hello(name) := f"Hello, {{ name }}!"
