FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Disable Prisma build errors
ENV TS_NODE_TRANSPILE_ONLY=true

CMD ["npx", "ts-node", "src/main.ts"]