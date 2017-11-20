#!/usr/bin/env bash

# SETUP_KEY
export SETUP_KEY=${SETUP_KEY:-$(pritunl setup-key)}
if [[ ! -z ${SETUP_KEY} ]]; then
  echo "${SETUP_KEY}" >/var/lib/pritunl/setup_key
fi

# settings settings
export MONGODB_URI=${MONGODB_URI:-${MONGO_PORT_27017_TCP_ADDR:-"mongodb://localhost:27017/pritunl"}}
export PRITUNL_REVERSE_PROXY=${PRITUNL_REVERSE_PROXY:-false}
export PRITUNL_SERVER_SSL=${PRITUNL_SERVER_SSL:-true}
export PRITUNL_SERVER_PORT=${PRITUNL_SERVER_PORT:-443}

pritunl set-mongodb "${MONGODB_URI}"
pritunl set app.reverse_proxy ${PRITUNL_REVERSE_PROXY}
pritunl set app.server_ssl ${PRITUNL_SERVER_SSL}
pritunl set app.server_port ${PRITUNL_SERVER_PORT}

cat /etc/pritunl.conf
pritunl start