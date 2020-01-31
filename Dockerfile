# Original developer: Maik Ellerbrock <opensource@frapsoft.com>

FROM node:10.18.1-alpine3.9

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.2.0"

WORKDIR /site

COPY ./src/gulpfile.js /site

RUN \
  apk add --no-cache dumb-init && \
  npm update && \
  npm install --global gulp-cli && \
  npm install gulp@^3.9.1  gulp-sass && \
  chown -R node:node /site

VOLUME /site

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "gulp" ]
