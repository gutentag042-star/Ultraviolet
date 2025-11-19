FROM node:18-alpine

ENV NODE_ENV=production

WORKDIR /app

COPY package*.json ./

RUN apk add --no-cache python3 make g++ \
 && npm ci --only=production

COPY . .

EXPOSE 8080

CMD ["node", "src/index.js"]
