#!/usr/bin/env ruby

require "thor"

class Db < Thor
  include Thor::Actions

  def self.exit_on_failure?
    false
  end

  desc "start", "Starts the db service"
  def start
    say "Starting db service"

    run("docker network create rails_app_test_3-bridge-docker-network", capture: true)
    run("docker volume create rails_app_test_3-data-volume", capture: true)

    db_port = ENV["DB_PORT"] || 5432

    say "Starting db service on port #{db_port}"

    run(
      <<~CMD.gsub(/\s+/, " ").strip,
        docker run --rm --detach --name rails_app_test_3-db \
          --env POSTGRES_HOST_AUTH_METHOD=trust \
          --network rails_app_test_3-bridge-docker-network \
          --env PGDATA=/var/lib/postgresql/data/pgdata \
          -v rails_app_test_3-data-volume:/var/lib/postgresql/data:delegated \
          --publish #{db_port}:5432 \
          postgres:latest
      CMD
      capture: false
    )
  end

  desc "stop", "Stops the db service"
  def stop
    say "Stopping db service"
    run("docker stop rails_app_test_3-db", capture: true )
  end

end

Db.start(ARGV)
