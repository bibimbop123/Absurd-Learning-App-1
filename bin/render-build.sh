#!/usr/bin/env bash
# Exit immediately if a command exits with a non-zero status
set -o errexit

# Install Ruby gems
bundle install

# Precompile Rails assets
bundle exec rake assets:precompile

# Clean up old assets
bundle exec rake assets:clean

# Run database migrations
bundle exec rake db:migrate

# Seed the database (idempotent seeds recommended)
bundle exec rake db:seed:replant
