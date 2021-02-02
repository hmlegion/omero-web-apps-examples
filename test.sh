#!/bin/sh

# You need to be in the project directory for this to work.
# cd omero-web-apps-examples/

# The OMERO server we want to connect to.
# host=192.168.31.13
host=omeroserver

# Path to the python module for the app.
appdir=$(pwd)/minimal-webapp/minimal_webapp

# Location within Docker instance we want to link the app, so it can be imported.
docker_appdir=/opt/omero/web/venv3/lib/python3.6/site-packages/minimal_webapp

# This example config file installs "minimal_webapp". See the file for more details.
config=$(pwd)/config.omero

# Location within Docker instance we want to mount the config.
docker_config=/opt/omero/web/config/config.omero

python_path=/opt/omero/web/venv3/bin:/omero-iviewer/plugin
iviewer_path=/opt/work/omero/omero-iviewer

# Run docker container.
# network 名称已经变成 name-of-directory_compose_network
docker run -it --rm -e PYTHONPATH=$python_path -e OMEROHOST=$host -p 4080:4080 --network docker-example-omero_omero -v $iviewer_path:/omero-iviewer -v $appdir:$docker_appdir -v $config:$docker_config openmicroscopy/omero-web-standalone
