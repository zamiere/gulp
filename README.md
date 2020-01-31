# gulp
## forked from ellerbrock/alpine-gulp-sass

_Compiling SASS has never been more easy ..._

## Installation

`docker pull zamiere/gulp`

## Configuration

### Volume Mappings

- `DIR_SASS`: map your local SASS folder inside the Container
- `DIR_CSS`: map your local CSS folder inside the Container

### SASS Files

- `FILES_SASS`: define what SASS files you want to use
	- `**/*.sass` uses all sass files in the folder and all subfolders (default)
	- `*.sass` uses the sass files in your current sass folder
	- `main.sass` uses only the main.sass file
	- `*.+(sass|scss)` uses all sass and scss files in the current folder

## Examples

### docker run

- maps the `sass` folder from your current directory
- maps the `css` folder from your current directory
- compiles all `*.sass` and `*.scss` files in your `sass` folder

```
docker run -it \
  -v ${PWD}/sass:/site/sass \
  -v ${PWD}/css:/site/css \
  -e SASS='*.+(sass|scss)' \
zamiere/gulp
```

### docker-compose

`.env`

```
DIR_SASS=./style/sass
DIR_CSS=./style/css
FILES_SASS=**/*.+(sass|scss)
GULP_DEBUG=true
```

`docker-compose.yml`

```
version: '3'

services:

  gulp:
    image: zamiere/gulp:latest
    volumes:
      - ${DIR_SASS}:/site/sass
      - ${DIR_CSS}:/site/css
    environment:
      - SASS=${FILES_SASS}
      - CSS=${DIR_CSS}
      - - GULP_DEBUG=${GULP_DEBUG}
    networks:
      - webdev

networks:
  webdev:
    driver: bridge
```
