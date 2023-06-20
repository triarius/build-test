FROM node:alpine
RUN addgroup -g 1001 -S appuser && \
    adduser -u 1001 -S appuser -G appuser
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
USER appuser
CMD ["npm", "start"]
