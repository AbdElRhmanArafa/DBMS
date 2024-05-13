#!/usr/bin/env bash

seperator=---------
seperator=$seperator$seperator
show_database() {
  local -a db_list=("${@}")
    # Check if arguments are provided
    if [ "$#" -eq 0 ]; then
        return 1  # Return non-zero status to indicate failure
    fi
    echo "$seperator"
    printf "| %s | %-12s|\n" "ID" "Data Base" 
    echo "$seperator"
    label=1
    for item in "${db_list[@]}"; do
        printf "| %d | %-12s|\n" "$label" "$item"
        ((label=label+1))
    done
    echo "$seperator"
}

show_database_tables() {
    # Check if arguments are provided
    if [ "$#" -eq 0 ]; then
        return 1  # Return non-zero status to indicate failure
    fi
    echo "$seperator"
    printf "| %-12s|\n" "Tables in $2"
    echo "$seperator"
    for item in $1; do
        printf "| %-12s|\n" "$item"
    done
    echo "$seperator"
}
