🚀 Automated Portfolio Website CI/CD
This project is a fully automated CI/CD pipeline that builds, packages, and deploys a static portfolio website using Jenkins, Docker, and Nginx.

🛠 Tech Stack
Frontend: HTML5, CSS3, JavaScript (stored in /templates)

Web Server: Nginx (Alpine-based Docker Image)

CI/CD: Jenkins Pipeline

Containerization: Docker

Registry: Docker Hub

🏗 Project Structure
Plaintext

<img width="671" height="167" alt="image" src="https://github.com/user-attachments/assets/8846fec2-cd79-41f3-bee0-4056e6528ca9" />

.

🔄 CI/CD Pipeline Workflow
The Jenkins pipeline is triggered automatically upon a git push to the main branch:

Checkout: Pulls the latest code from GitHub.

Build: Packages the static files from the /templates folder into a custom Nginx Docker image.

Push: Tags and pushes the image to Docker Hub (sanju1701/portfolio-website-static).

Deploy: Pulls the fresh image on the production server, stops the old container, and starts the new one on port 9090.

🐳 Docker Configuration
The Dockerfile is optimized for performance and security:

Uses nginx:alpine for a small footprint.

Clears default Nginx placeholders to prevent the "Welcome to nginx" screen.

Ensures correct file permissions (755) to avoid 403 Forbidden errors.

🚀 How to Run Locally
If you want to run this container locally without Jenkins:

Bash
# Build the image
docker build -t portfolio-local .

# Run the container
docker run -d -p 9090:80 --name my-portfolio portfolio-local , 
View your site at http://localhost:9090.

