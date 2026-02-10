FROM nginx:alpine

# 1. Clean out any default files
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy everything FROM the templates folder into Nginx's root
# This puts index.html exactly where Nginx expects it
COPY templates/ /usr/share/nginx/html/

# 3. Fix permissions just in case
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
