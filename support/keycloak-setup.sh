#!/bin/sh
echo "Using config file ${1} for setup"
${JBOSS_HOME}/bin/standalone.sh \
	-Djboss.http.port=8080 \
	-Dkeycloak.migration.action=import \
	-Dkeycloak.migration.provider=singleFile \
	-Dkeycloak.migration.file=${1} \
	-Dkeycloak.migration.strategy=OVERWRITE_EXISTING &
sleep 30
pkill -f keycloak
