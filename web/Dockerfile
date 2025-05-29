# Use official Node image
FROM node:18

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install with legacy-peer-deps
RUN npm install --legacy-peer-deps

# Build the frontend
RUN npm run build

# Expose port
EXPOSE 3000

# Start app
CMD ["npm", "run", "start"]
