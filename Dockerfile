# Multi-stage build for Angular
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy source code
COPY . .

# Build Angular application
RUN npm run build --configuration production

# Production stage with nginx
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy built Angular app
COPY --from=build /app/dist/watering-app /usr/share/nginx/html

# Create basic nginx config
RUN echo 'server { listen 80; location / { try_files $uri $uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
