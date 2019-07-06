# VCN Watchdog for Kubernetes
This project provides a tool for _CONTINUOUS VERIFICATION_ (CV) via CodeNotary.
The CodeNotary vcn project can be found here: https://github.com/vchain-us/vcn

The idea behind CV is to continuously monitor your application environment at
runtime and prevent unknown/bad containers from being executed.

![alt text](https://github.com/vchain-us/vcn-k8s/blob/master/vcn-k8s.png "VCN K8s Daemonset")


## Usage
Check out the project, edit the `verify.prometheus` file and fill in whatever
alerting/monitoring functionality you want.

Build the container image and change the daemonset to match the image name
`docker-compose build`

Make sure /var/run/docker.sock is accessible read-only.

Deploy the daemonset to your Kubernetes cluster:

`kubectl apply -f vcn-k8s-daemonset.yaml`


## Design
This tool is designed as a sidecar for your existing Kubernetes environment. All
running containers are continuously checked via `vcn` for integrity. If a
container fails the verification check, a customisable alert is triggered.

