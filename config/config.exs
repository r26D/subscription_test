# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :subscription_test, SubscriptionTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NGuFU/Kszq6NM85xXKHkO+obzf6iLKgcRSQG2DL+HvIHJoDDQ4O4GgTsh5ajIcNy",
  render_errors: [view: SubscriptionTestWeb.ErrorView, accepts: ~w(json)],
  pubsub: [
    name: SubscriptionTest.PubSub,
    # adapter: Phoenix.PubSub.PG2
    adapter: Phoenix.PubSub.Redis,
    node_name: System.get_env("HOSTNAME") || "subscription_test",
    url: System.get_env("REDIS_PUBSUB_URL") || "redis://localhost:6379/0"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
