import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :toy_app, ToyApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "toy_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :toy_app, ToyAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "SQSTnlYVvCw4Ie2sKK1Jbst1u7D8ZFn47AtLaAmuWpV8OZsSMw7Aa0rRpJn4JzeD",
  server: false

# In test we don't send emails.
config :toy_app, ToyApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
