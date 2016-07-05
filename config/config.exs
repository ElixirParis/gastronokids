# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gastronokids,
  ecto_repos: [Gastronokids.Repo]

# Configures the endpoint
config :gastronokids, Gastronokids.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j458rtSt4qQnUmBDEVmjX3X6tCtLLjWJy6rhO58WO86s1S2I3i4zePgdcV/T3N41",
  render_errors: [view: Gastronokids.ErrorView, accepts: ~w(html json)],
  # This is mapping between name and pubsub backend
  pubsub: [name: Gastronokids.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
