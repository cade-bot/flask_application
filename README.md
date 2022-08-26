# flask_application

This is my fantasy MMA sports app.
The aim of this application is to be able to create a stable (read: team) and add fighters to it. It should have CRUD functionality, allowing you to create stables, retrieve information, update stables and delete them. 

## Project Documentation and Diagrams:

### ERD Diagram:
https://drive.google.com/file/d/1Unz3YXWGuR_iYvTQGLM42tUIxbiCwr6r/view?usp=sharing

### Infrastructure & CICD Diagram:
https://drive.google.com/file/d/1yqgCKKP1wAZflpK-7yVb_te081AVIj8X/view?usp=sharing

### Project Risk Assessment:
https://drive.google.com/file/d/1fG4q24cN2jqKVqAH1xde9yTyvDKB78sk/view?usp=sharing


## Project Timeline and Build Steps:

## Step 1 - Create ERD diagram and Jira Board Creation
I created an ERD diagram using draw.io. The link below will take you to the ticket in Jira with the diagram attached. I have also attached a link to my ERD diagram on Google Drive.

https://cadeqaproject.atlassian.net/browse/FMA-1?atlOrigin=eyJpIjoiODUwNTA0YzczMjExNDFhZDk2YTIwMjA3ZjhhYjkwZTUiLCJwIjoiaiJ9

## Step 2 - Create the MYSQL Docker container
I created a Docker container and implemented MYSQL for my database. Once I created the database, I created two tables: roster & stables. I populated the roster table with information about fighters that you can add to your created stable. I then exported the schema to my local machine.

## Step 3 - Create the flask app
I created the flask app in Pycharm. I first used the flask framework to write my application and then created the HTML pages. It connects to a MYSQL database to serve information on a HTML webpage, allowing users to create, view, update and delete their stables.

## Step 4 - Containerise app
I dockerised the flask app by creating a docker file. This allowed me to put my application in to a container and run it. I then added a docker configuration for both my mysql container and flask container to a docker-compose.yml file.
After I built these containers I pushed the docker images to my dockerhub registry.

## Step 5 - Docker Swarm
I used the docker-compose.yml file to deploy both my containers together using docker swarm. I updated my application configuration to allow the connectivity between these two containers.

## Step 6 - GitHub
I uploaded my flask application along with my docker files to github. I did this so I can pull the applicaton during my jenkins pipeline.

## Step 7 - Jenkins
I replicated my build steps within a Jenkins pipeline file and set up a webhook to allow for any pushes to my git repo that contains my flask application to trigger the jenkins pipeline.
