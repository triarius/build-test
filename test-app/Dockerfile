FROM node:alpine
RUN addgroup -g 1001 -S appuser && \
    adduser -u 1001 -S appuser -G appuser
USER appuser
WORKDIR /app
COPY --chown=appuser:appuser package*.json ./
RUN npm install
COPY --chown=appuser:appuser . .
RUN npm run build
CMD ["npm", "start"]
