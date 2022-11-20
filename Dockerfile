FROM public.ecr.aws/docker/library/node:current-alpine3.16

WORKDIR /app
RUN npm install jwt-cli
ENTRYPOINT [ "npx", "jwt" ]
