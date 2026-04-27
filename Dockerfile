FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# BUILD TYPESCRIPT
RUN npm run build

# START APP
CMD ["node", "dist/main.js"]
