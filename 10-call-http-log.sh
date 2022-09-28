#!/usr/bin/env bash
source 00-common.sh

$CURL --header "Host: www.example.com" http://localhost:8080/http-log
