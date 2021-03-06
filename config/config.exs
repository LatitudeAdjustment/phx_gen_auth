# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :auth,
  ecto_repos: [Auth.Repo]

config :auth_web,
  ecto_repos: [Auth.Repo],
  generators: [context_app: :auth]

# Configures the endpoint
config :auth_web, AuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/tYg4GAu4eGn3j1irWofdSC8KBXnxbGG4Dckm1v0iMbcURNwIKghluV0E1Up9GwQ",
  render_errors: [view: AuthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Auth.PubSub,
  live_view: [signing_salt: "AkiZzaUg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# In your config/config.exs file
if Mix.env() == :test do
  config :auth, Auth.Mailer, adapter: Auth.SMTPTestAdapter
end

# Elixir timezone database
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
