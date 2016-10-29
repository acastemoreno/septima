# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :septima,
  ecto_repos: [Septima.Repo]

# Configures the endpoint
config :septima, Septima.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dLXhfZt07qAZJ5xem2S52hejOumhrcr0oX0b68f7inx0bQnFsFZ3yjlA7BzdVgP1",
  render_errors: [view: Septima.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Septima.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
    providers: [
      github: {Ueberauth.Strategy.Github, []}
    ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
