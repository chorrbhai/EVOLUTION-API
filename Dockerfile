FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm install -g ts-node typescript

# 🔥 FORCE START (ignore npm start completely)
ENV NODE_OPTIONS="--max-old-space-size=256"
CMD ["npx", "ts-node", "src/main.ts"]
