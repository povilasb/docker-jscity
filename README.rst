=====
About
=====

This is a recipe to build a Docker image for
`JSCity <https://github.com/aserg-ufmg/JSCity>`_ project.

Usage
=====

Build image::

    $ make image

Create container::

    $ make container

The created container has an assigned name *povilasb-jscity*::

    $ docker inspect povilasb-jscity | grep IP

Also port *8888* is forwarded.
So you can access JSCity from localhost: `http://localhost:8888`.
