#!/bin/bash

/home/esuser/logstash/bin/logstash -f logstash.conf

tail -f /dev/null
