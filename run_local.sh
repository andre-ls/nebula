#!/bin/sh
podman run --rm -d -v .:/nebula -p 3000:3000 jekflix_container
