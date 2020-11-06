# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :digital_collections, DigitalCollectionsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FIYdLuXXthlpfR6pnXLAYfT73ARyTpYdEruCBOaluB45iyfj5Hfw+KHJvMZGR3PQ",
  render_errors: [view: DigitalCollectionsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DigitalCollections.PubSub,
  live_view: [signing_salt: "M1riBaJQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure solr
config :hui, :default,
  url: "http://digital_collections.dev.solr.lndo.site/solr/digital_collections-core-dev",
  handler: "select", # optional
  headers: [{"accept", "application/json"}], # optional
  options: [recv_timeout: 10000] # optional

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
