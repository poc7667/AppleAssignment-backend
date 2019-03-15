# DEMO Site

This live demo has been deployed to a cloud server.

https://birchwords.co/apple_demo/demo.html

The React/Redux will interact with the backend service through RESTful API.

## How to input the tree value.
- Please refer the demo video or copy existing samples' input
- Each node is separated by common, `null node` is represented by `#`(Required).

# Data flow

![inline](https://i.imgur.com/9UzOrFc.png=300x "Title")

 
# INSTALLATION STEP

- Get docker install on your system.

- Refer to the `docker-compose.yml` under this project.

# Build steps

- Build the image `docker-compose build`
- Run the Docker compose `docker-compose up` which will bring web server and the db server up

# Tech stack

- Web server: Nginx
- Backend: Ruby on Rails 5.2.2
- Frontend: React/Redux, Bootstrap, Webpack 
- DB: PostgreSQL 

# Source code

- Backend repo https://github.com/poc7667/AppleAssignment-backend
- Frontend repo https://github.com/poc7667/AppleAssignment-frontend

# Notes

If Dockerized Rails could not connect to the PostgreSQL DB,
Please update the database.yml file to `host:db`
