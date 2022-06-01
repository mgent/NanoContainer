# minimal-container
Example of near-smallest-size container, using assembler, to show how small containers can be and how few dependencies they can have.

It just prints "Hello World" to stdout every second so it stays running and demonstrates container output.  
The very smallest size binary (which *might* yield a slightly smaller container) would just exit immediately, but that is not useful for demonstration purposes.

You can check the size and contents of the container in two ways in a directory of choice:
1. Inspecting the image by executing these commands, and then browsing the resulting files, specifically the container 'layer.tar' file:
   ```bash
   docker pull mgent/minimal-container:latest
   docker save mgent/minimal-container > minimal-container.tar
   tar xf minimal-container.tar
   ```
   You will see that there is only 1 binary, which is the above 'Hello World' app.
2. Inspecting the container's filesystem by running a copy of it, exporting the container's filesystem as a tar archive, expanding the archive and inspecting it.
   ```bash
   docker run --rm -d --name minimal-container mgent/minimal-container:latest
   docker export minimal-container > minimal-container.tar
   docker container stop minimal-container
   tar xf minimal-container.tar
   ```
   You will see that there is only 1 binary, which is the above 'Hello World' app, as well as a a couple of directories and files that Docker clearly always adds, but all those files are empty.
