#!/bin/bash
minikube ssh -- 'ps aux | grep kube-scheduler'
