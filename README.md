# HUGO Website Engine in Docker

**Dockerized version of the HUGO (gohugo.io) executable. Provides a quick way to run the HUGO linux executable from a docker image.**

More about Hugo: http://www.gohugo.io/

## Running

This is a simplistic example of how to call the hugo executable:

    docker run --rm -ti giantswarm/hugo help

To make it really useful, you'll need to mount the current directory to the container, so hugo can write files:

    docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) giantswarm/hugo new site ./site

To make the command a bit more accessible, create an alias. Note that we add the `-p` option here to make hugo's HTTP port 1313 available.

    alias myhugo="docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) -p 1313:1313 giantswarm/hugo"

Then we can call hugo like this:

    # Creating a new site in folder ./site
    myhugo new site ./site

    # Serve using hugo's built-in server
    # (use your currect Docker IP address in the baseUrl)
    myhugo server --theme=hyde --baseUrl=http://192.168.59.103 --bind=0.0.0.0 -s ./site

    # Generate public files and exit
    myhugo --theme=hyde --baseUrl=http://192.168.59.103 -s ./site

## Build your own

To build your own image, do this:

    docker build -t giantswarm/hugo .
