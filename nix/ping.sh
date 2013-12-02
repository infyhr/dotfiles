#!/bin/bash
ping -c 1 webmail.carnet.hr | /home/infy/Projects/regex.py '(.*)time=([0-9]*)' | cut -c76-80
