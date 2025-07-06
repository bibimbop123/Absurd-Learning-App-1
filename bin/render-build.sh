#!/usr/bin/env bash
set -o errexit

echo "Installing Ruby gems..."
bundle install

echo "Precompiling Rails assets..."
bundle exec rake assets:precompile

echo "Cleaning up old assets..."
bundle exec rake assets:clean

echo "Running database migrations..."
bundle exec rake db:migrate

echo "Seeding database..."
if [[ "$RAILS_ENV" == "production" ]]; then
  echo "WARNING: Reseeding production database (all data will be wiped)!"
  DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:seed:replant
else
  bundle exec rake db:seed:replant
fi
