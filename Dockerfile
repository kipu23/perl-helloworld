FROM alpine/git:latest as clone
WORKDIR /app
RUN git clone https://github.com/kipu23/perl-helloworld.git
RUN git rev-parse master
RUN git rev-parse master >> version.txt

