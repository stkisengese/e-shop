#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /rails/tmp/pids/server.pid

# Migrate the database (only if there are pending migrations)
echo "Running database migrations..."
rails db:migrate

# Seed the database (this can always be safely run)
echo "Seeding the database..."
rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"