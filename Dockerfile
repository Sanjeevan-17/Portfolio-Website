# Use lightweight Nginx image
FROM nginx:alpine

# Copy all files into Nginx html folder
COPY . /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
