#!/bin/bash
# Author: TianChi
# Date: 2016-08-11
# Desc: scrips to sync git project certain dir to consul k/v store, also support git branch for configuration management
git2consul --endpoint mesos-master --port 8500 --config-file git2consul-demo.json
