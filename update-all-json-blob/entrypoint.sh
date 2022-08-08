#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

bundle check || bundle install -j "$(nproc)"
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
