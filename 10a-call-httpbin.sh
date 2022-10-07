#!/usr/bin/env bash
source 00-common.sh

$CURL --header "Host: www.example.com" http://localhost:8080/httpbin/headers
#print-cert localhost 8080 http -M -B -a www.example.com -p /httpbin/headers
