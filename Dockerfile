FROM delitescere/jdk
MAINTAINER mark.turner@collinsongroup.com

# Create installation location
# Create data & config folder
# Download TC and install to default location
# Add the MS SQL JDBC driver
RUN mkdir -p /opt/scripts && \
mkdir -p /var/lib/teamcity/config /var/lib/teamcity/lib/jdbc /tmp/jdbc && \
curl -L https://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_4.2.6420.100_enu.tar.gz | tar -xz -C /tmp/jdbc sqljdbc_4.2/enu/sqljdbc4.jar && find /tmp/jdbc/sqljdbc_4.2/enu/ -name '*.jar' -exec mv {} /var/lib/teamcity/lib/jdbc \+ && rm -rf /tmp/jdbc && \
curl -L https://download.jetbrains.com/teamcity/TeamCity-9.1.3.tar.gz | tar -xz -C /opt

# Set the data folder for TeamCity and expose it
ENV TEAMCITY_DATA_PATH /var/lib/teamcity
VOLUME /var/lib/teamcity

# Expose the standard TeamCity port
EXPOSE 8111

# Add the startup script
COPY src/startup.sh /opt/scripts/

# Run TeamCity
ENTRYPOINT ["/opt/scripts/startup.sh"]
