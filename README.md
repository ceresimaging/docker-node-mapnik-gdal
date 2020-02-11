# docker-node-mapnik-gdal
Docker Image with Mapnik Node including full GDAL functionalities

1. Use the image as base in your `Dockerfile`:

    `FROM maurimiranda/node-mapnik-gdal:latest`

2. Add Mapnik dependency in your `package.json` as follow:

    `"mapnik": "file:/src/node-mapnik"`
