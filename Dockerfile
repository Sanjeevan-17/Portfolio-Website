# Use lightweight Nginx image
FROM nginx:alpine

# 1. Remove the default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy your portfolio files into the Nginx html directory
# Note: We copy to the FOLDER path, not a filename
COPY . /usr/share/nginx/html/

# Expose HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
