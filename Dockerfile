# syntax=docker/dockerfile:1.4

FROM ubuntu:22.04

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends curl
