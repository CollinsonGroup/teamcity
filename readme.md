# CollinsonGroup/TeamCity

TeamCity....Dockerized.

The container is a simple installation of TeamCity 9.X. At present, the changes from default are:
- Set to recommended memory settings (1GB heap, 270MB perm space)
- Includes the MS SQL JDBC4 driver
- Includes git and svn

The container splits out the folders in the TeamCity data folder so that they can be separately mounted giving you some flexibility to the location of these files.

Under the hood it is running Alpine Linux with JDK 1.8.

## Running

To run the container to start up a simple instance of TeamCity with an internal data store, you'll only need to specify the port. The container exposes a single port *8111* for accessing TeamCity. Start up the container as:

```bash
> docker run -d --name teamcity -p 8111:8111 collinsongroup/teamcity
```

You will now have a container running as **teamcity** listening on port 8111. You should now be able to access the TeamCity start-up screen on (http://localhost:8111).

Once the container is destroyed you will **lose** all data, config, artifacts, builds, and love and care that you've put into setting up.

The container also exposes multiple volumes for the TeamCity data folder (but not the whole data folder itself):
- /var/lib/teamcity/config
- /var/lib/teamcity/plugins
- /var/lib/teamcity/lib
- /var/lib/teamcity/keys
- /var/lib/teamcity/backup

This gives you some flexibility to override the parts that you want to keep locally. Some of the folders, like lib, would contain items such as the included JDBC driver which would be lost when you override the folder.  

**Mounting at least the config folder to somewhere local is heavily advised. If you don't do this, when you remove the container, you will lose everything!**

Override the folders as usual with Docker:

```bash
> docker run -d --name teamcity -p 8111:8111 -v /myData/config:/var/lib/teamcity/config -v /somewhere/else/keys:/var/lib/teamcity/keys collinsongroup/teamcity
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
