# README

[![Build Status](https://travis-ci.com/NJubenville/web615-final-assignment-base.svg?branch=master)](https://travis-ci.com/NJubenville/web615-final-assignment-base)

**Project Author:** Nathan Jubenville

**Course Code: WEB615**

**Desciption:** This application is a final project i had to do for this course. It allows for a user to login and view articles and comments about totally legit news.

**Reasons why we used the following techologies:**

- **RSPEC** - to test our code and make sure the code is able to handle any errors that it might face during it life cycle. We picked this code cause of it ease of use to add into a ruby's project and its english like syntax is easy to read and use.
- **Pundit** - to add authorization into our application so users can't do things they aren't suppose to like delete users. We used Pundit for its ability to easily add authorization into application and add policies that prevent users to do certain things
- **Rubocop** - To make sure that our application is held to ruby's standards in everyway. Its quick and easy to install into our application and right out of the gate is really effective at bullying i mean linting.
- **Bundle-Audit** - To make sure that every gem we used it safe and valid and in turn keep our application safe from possible leaks or hacks. We used bundle audit cause we were already using bundle for all of our package installs and it was easy to use and add into our application.
- **Docker** - Docker allows our application to be more efficient of our systems resources. We used it in our application to allow us to learn the new way of deploy applications that quicker to boot and end, and use our systems resources more efficiently.
- **Docker-Compose** - Docker-Compose allows us to be able to run and manage multiple docker applications and allows us to create dockerfile that can reproduce our application environment anywhere. We used Docker-Compose to make it easy for anyone downloading our code to be able to use on there machines without any problems
- **Heroku** - Heroku is a platform as a service that allows developers to build, run, and operate applications on the cloud. We user Heroku to learn how to deploy our applications easily to the cloud and how to run and use a service like this.

**Installation Guide**

1. [RMV](https://rvm.io/rmv/install) Install rvm for you system
2. ``` rvm install ruby-2.6``` install ruby
3. ``` rvm use ruby-2.6``` use that version of ruby
4. ```gem install rails -v 5.2.3``` install rails
5. [Install Docker](https://docs.docker.com/install) select your OS and follow the install guide.
6. [Fork My Code](https://github.com/NJubenville/web615-final-assignment-base)
7. In the root of the project. run ```bin/setup```
8. After that all thats need to rebuild your Docker is ```docker-compose up```

**Completed tasks:**4.1, 4.2, 4.3, 4.4, 4.5, 4.5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 7, 8.1, 8.2, 12, 13