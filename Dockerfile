# syntax=docker/dockerfile:1.4

FROM ubuntu:22.04

ARG TARGETOS
ARG TARGETARCH

ARG DOCKER_COMPOSE_VERSION=1.27.4

SHELL [ "bash", "-euc" ]

RUN <<BASH
export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y --no-install-recommends apt-transport-https
apt-get install -y --no-install-recommends bash
apt-get install -y --no-install-recommends ca-certificates
apt-get install -y --no-install-recommends wget
apt-get install -y --no-install-recommends git
apt-get install -y --no-install-recommends gnupg-agent
apt-get install -y --no-install-recommends jq
apt-get install -y --no-install-recommends openssh-client
apt-get install -y --no-install-recommends perl
apt-get install -y --no-install-recommends python3
apt-get install -y --no-install-recommends python3-pip
apt-get install -y --no-install-recommends rsync
apt-get install -y --no-install-recommends software-properties-common
apt-get install -y --no-install-recommends tini

wget -qO- https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=$TARGETARCH] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y --no-install-recommends docker-ce-cli docker-compose-plugin
rm -rf /var/lib/apt/lists/*

pip3 install docker-compose==$DOCKER_COMPOSE_VERSION

ln -s /usr/bin/tini /usr/sbin/tini
BASH

ENV BUILDKITE_AGENT_CONFIG=/buildkite/buildkite-agent.cfg \
    PATH="/usr/local/bin:${PATH}"

RUN <<BASH
mkdir -p /buildkite/builds /buildkite/hooks /buildkite/plugins
wget -qO /usr/local/bin/ssh-env-config.sh https://raw.githubusercontent.com/buildkite/docker-ssh-env-config/master/ssh-env-config.sh
chmod +x /usr/local/bin/ssh-env-config.sh
BASH

VOLUME /buildkite
ENTRYPOINT ["buildkite-agent-entrypoint"]
CMD ["start"]
