FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm install -g ts-node typescript

ENV NODE_ENV=production

CMD ["npx", "ts-node", "src/main.ts"]
