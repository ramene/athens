# https://hub.docker.com/_/ramene
FROM ramene/node:10.20.1-buster-slim as build
COPY . /usr/src/athens
WORKDIR /usr/src/athens
RUN yarn

# https://hub.docker.com/_/clojure
FROM clojure:openjdk-14-lein-2.9.1-alpine
COPY --from=build /usr/src/athens /usr/src/app
WORKDIR /usr/src/app
CMD ["lein", "dev"]