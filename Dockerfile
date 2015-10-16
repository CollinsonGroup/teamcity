FROM delitescere/jdk

# Update the os
# Download TC and install to default location
RUN apt-get update -f && apt-get upgrade -y && apt-get clean && / 
curl -L https://download.jetbrains.com/teamcity/TeamCity-9.1.3.tar.gz | tar -xz -C /opt

# Set the data folder for TeamCity and expose it
ENV TEAMCITY_DATA_PATH /var/lib/teamcity
VOLUME /var/lib/teamcity

# Expose the standard TeamCity port
EXPOSE 8111
