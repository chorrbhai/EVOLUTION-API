FROM node:20-alpine

WORKDIR /app

# Copy package files first
COPY package*.json ./

RUN npm install

# 🔥 NOW copy full project (THIS WAS MISSING BEFORE PRISMA)
COPY . .

# Prisma commands AFTER copying files
RUN npx prisma generate
RUN npx prisma migrate deploy

# Build app
RUN npm run build || true

EXPOSE 10000

CMD ["npm", "run", "start"]
