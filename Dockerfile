FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Build TypeScript → JS
RUN npm run build

# Run compiled app
CMD ["node", "dist/main.js"]
