FROM public.ecr.aws/docker/library/node:18-alpine

WORKDIR /app
RUN npm install jwt-cli
ENTRYPOINT [ "npx", "jwt" ]
