#!/bin/bash

info_txt(){
	echo 'Usage: ./laptop-tool.sh [OPTION]

  --boost-off

  --boot-on

  --powersave

  --ondemand

  --cpu-info
 
  --ip-info
'
}

case $1 in
	"--boost-off")
		echo 0 > /sys/devices/system/cpu/cpufreq/boost;;
	"--boost-on")
		echo 1 > /sys/devices/system/cpu/cpufreq/boost;;
	"--powersave")
		cpupower frequency-set -g powersave;;
	"--ondemand")
		cpupower frequency-set -g ondemand;;

	"--cpu-info")
		echo ""
		[ $(cat /sys/devices/system/cpu/cpufreq/boost) == 1 ] && echo "BOOST ON" || echo "BOOST OFF"
		echo ""
		lscpu | grep "CPU MHz"
		lscpu | grep "CPU max MHz"
		lscpu | grep "CPU min MHz"
		echo ""
		cpupower frequency-info;;
	"--ip-info")
		ip a | grep "inet ";;

	"--help")
		info_txt;;

	*) echo "Try 'laptop-tool --help' for more information.";;

esac



