#!/usr/bin/env bash
set -o errexit

# Install Ruby gems
bundle install

# Precompile Rails assets
bundle exec rake assets:precompile

# Clean up old assets
bundle exec rake assets:clean

# Run database migrations
bundle exec rake db:migrate

# Forcefully replant seeds in production (DANGER: this will wipe all data)
if [[ "$RAILS_ENV" == "production" ]]; then
  DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:seed:replant
else
  bundle exec rake db:seed:replant
fi
