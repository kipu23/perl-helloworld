FROM alpine/git:latest as clone
WORKDIR /app
RUN git clone https://github.com/kipu23/perl-helloworld.git

FROM maven:adoptopenjdk as build
WORKDIR /app
COPY --from=clone /app/perl-helloworld /app
RUN git rev-parse master >> version.txt
