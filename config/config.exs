# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :todox, Todox.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "//7TgLEYNDyt6Rgb7/vViTOw4/kP2c2vnspcRUqFFqJaAdwQXr6s/MAQVNOvbVPx",
  render_errors: [view: Todox.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Todox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Config Repo
config :todox, ecto_repos: [Todox.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian Config
config :guardian, Guardian,
  issuer: "Todox.#{Mix.env}",
  ttl: {30, :days},
  serializer: Todox.GuardianSerializer,
  verify_issuer: true,
  secret_key: System.get_env("TODOX_API_JWK")
  
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
