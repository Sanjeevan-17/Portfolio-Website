# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Step 1: Remove any default files Nginx might have
RUN rm -rf /usr/share/nginx/html/*

# Step 2: Copy your files into the correct directory
# Using '.' assumes your Dockerfile is in the same folder as index.html
COPY . /usr/share/nginx/html/

# Step 3: Fix permissions (The 403 Forbidden Killer)
# This ensures the Nginx user can actually read your files
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
