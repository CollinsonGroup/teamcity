# CollinsonGroup/TeamCity

TeamCity....Dockerized.

The container includes the MS SQL JDBC4 driver.

## Running 

To run the container to start up a sinple instance of TeamCity with an internal data store, you'll only need to specify the port. The container exposes a single port *8111* for accessing TeamCity. Start up the container as:

```bash
> docker run -d --name teamcity -p 8111:8111 collinsongroup/teamcity
```

You will now have a container running as **teamcity** listening on port 8111. You should now be able to access the TeamCity start-up screen on (http://localhost:8111).

Once the container is destroyed you will **lose** all data, config, artifacts, builds, and love and care that you've put into setting up.

The container also exposes a single volume for the TeamCity data folder as **/var/lib/teamcity**. This is more useful if you want to use TeamCity in a production environment. This will keep your data/config/etc in a folder that you will have access to. Assuming we want to keep our data locally in **/data**

```bash
> docker run -d --name teamcity -p 8111:8111 -v /var/lib/teamcity:/data collinsongroup/teamcity
```


## Building

On a Linux machine with Docker, change to the project folder and:

```bash
> docker build -t collinsongroup/teamcity .
```

If you are on a non-Linux OS, you can use the bundled Vagrant file to create a build environment:

```bash
> vagrant up
> vagrant ssh
> cd /vagrant
> docker build -t collinsongroup/teamcity .
```
