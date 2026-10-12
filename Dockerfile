FROM nginx:alpine

# Add Docker labels
LABEL owner="pradeep" \
      team="devops" \
      date="2026-10-12"

# Configure Nginx to listen on port 8080
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Create the welcome page
RUN echo 'Welcome to label test.' > /usr/share/nginx/html/index.html

# Expose port 8080
EXPOSE 8080
