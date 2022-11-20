# syntax=docker/dockerfile:1.4
FROM public.ecr.aws/docker/library/node:18-alpine

ARG USER_ID
ARG GROUP_ID

# Create a user in the docker image that has a home directory and the SAME
# user and group ids as that of the host non-root user. This user and group
# will be named 'node' inside the container, only for simplicity.
# The purpose is so that the repository can be mounted inside the
# container and the conatainer's user uses the same uid/gid as the host
# user when writing files so that the host use will not have any
# impedimet to cleaning up files created by the container.
RUN <<EOF
    set -euo pipefail
    deluser --remove-home node
    GROUP=$(awk -v val="$GROUP_ID" -F: '$3==val{print $1}' /etc/group | grep . || echo node)
    addgroup -g $GROUP_ID $GROUP || true
    USER=$(awk -v val="$USER_ID" -F: '$3==val{print $1}' /etc/passwd | grep . || echo node)
    adduser -D -u $USER_ID -G $GROUP $USER || true
EOF

USER ${USER_ID:?}:${GROUP_ID:?}
WORKDIR /.buildkite
