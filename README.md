# docker-image-with-label
This is a simple docker image which defines two labels.

Here’s a `Dockerfile` that uses Nginx as the web server, listens on port `8080`, displays “Welcome to label test.”, and includes the three Docker labels you requested, with today's date (`2026-10-12`).

## Dockerfile

Writing

```
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
```

## Build and run the Docker image

1. Save the file as `Dockerfile`.
2. Build the image:

bash
```
docker build -t label-test .
```

3. Run the container:

bash
```
docker run -d --name label-test-container -p 8080:8080 label-test
```

4. Access the web page in your browser at:

[http://localhost:8080](<http://localhost:8080>)

Expected output:

Nginx web page

## Welcome to label test.

## Verify the Docker labels

Run this command to inspect the labels attached to your image:

bash
```
docker image inspect label-test \
  --format '{{json .Config.Labels}}'
```

Expected output:

json
```
{
  "owner": "pradeep",
  "team": "devops",
  "date": "2026-10-12"
}
```

Note: `EXPOSE 8080` documents the container port; the `sed` command actually configures Nginx to listen on port `8080`, and `-p 8080:8080` maps that port to your host machine.
