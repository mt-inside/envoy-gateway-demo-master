#!/usr/bin/env bash
source 00-common.sh

$CURL --header "Host: www.example.com" http://localhost:8080/http-log
#print-cert localhost 8080 http -M -B -a www.example.com -p /http-log
