#!/bin/sh
set -e

echo "Standing up Teamcity"
exec /opt/TeamCity/bin/teamcity-server.sh run
