#!/bin/bash

: '
    Title: CPU USAGE MONITORING
    AUTHOR: UMESH SAMAL
    DATE: 23TH AUGUST, 2023
'


# ps -eocomm,pcpu | grep -E -v '(0.0)' 



function cpu_stats {
    echo "........................................"
    echo "..........CPU USAGE.............."
    echo "........................................"
    ps -eocomm,pcpu | grep -E -v '(0.0)' >>"$1".txt
}


function cpu_stats_top {
    echo "........................................"
    echo "..........CPU USAGE.............."
    echo "........................................"
    top >> "$1".txt
}