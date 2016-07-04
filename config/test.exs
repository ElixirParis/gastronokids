use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gastronokids, Gastronokids.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :gastronokids, Gastronokids.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "phoenix",
  password: "passw0rd",
  database: "gastronokids_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
