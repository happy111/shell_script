#!/bin/bash

: '
    Title: CPU USAGE MONITORING
    AUTHOR: UMESH SAMAL
    DATE: 23TH AUGUST, 2023
'



echo $HOSTNAME
source cpu_usage.sh
source mem_usage.sh
source file_op.sh
source email.sh


echo "
   Select your choice:
   1. CPU Statistics - Enter CPU/cpu/Cpu
   2. Memory Statistics - Enter Mem/mem/Memory
   0. Exit
"


remove_file ".*"
read -rp "Enter your choice :" choice
read -rp "Enter output file :" output_file

create_file "$output_file"

# list_files_directories
# check_file_present "$output_file"


# if [[ $choice == 'cpu' ]]
# then
# 	cpu_stats
# elif [[ $choice == 'mem' ]]
# then
# 	mem_stats
# else
# 	echo "Please choose valid options"
# fi



case $choice in
	1|cpu|CPU|Cpu) 
			cpu_stats "$output_file"
	     ;;
	2|mem|Mem|memory) 
			mem_stats "$output_file"
	     ;;
	3|All)
			cpu_stats "$output_file"
			mem_stats "$output_file"
		;;
	0)
			exit 0
		;;
	*)
	 echo "Please enter valid input"
	 exit 1
esac


cupsfilter "$output_file".txt > "$output_file".pdf

read -rp "Enter sender email id:" sender
read -rp "Enter receiver email id:" receiver
read -rp "Enter gmail_password :" gmail_password
read -rp "Enter subject :" subject


send_email "$sender" "$receiver" "$gmail_password" "$subject" "$output_file".pdf
# remove_file "$output_file".*