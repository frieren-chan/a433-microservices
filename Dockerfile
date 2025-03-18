# Use Node.js version 14
FROM node:14

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Set environment variables
ENV NODE_ENV=production \
    DB_HOST=item-db

# Install dependencies and build application
RUN npm install --production --unsafe-perm && npm run build

# Expose application port
EXPOSE 8080

# Run application
CMD ["npm", "start"]
