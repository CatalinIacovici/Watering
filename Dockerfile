# Multi-stage build for Angular
FROM node:22-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install all dependencies (including devDependencies for building)
RUN npm ci

# Copy source code
COPY . .

# Build Angular application for production
RUN npm run build

# Production stage with nginx
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy built Angular app from the correct output directory
COPY --from=build /app/dist/Watering/browser /usr/share/nginx/html

# Create nginx config with proper Angular routing support
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
