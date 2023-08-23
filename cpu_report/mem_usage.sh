#!/bin/bash

: '
    Title: CPU USAGE MONITORING
    AUTHOR: UMESH SAMAL
    DATE: 23TH AUGUST, 2023
'



function mem_stats {
    echo "........................................"
    echo "..........MEMORY USAGE.............."
    echo "........................................"
    ps -eocomm,pmem | grep -E -v '(0.0)' >> "$1".txt
}