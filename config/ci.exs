use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :digital_collections, DigitalCollectionsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Configure solr
config :hui, :default,
  url: "http://localhost:8888/solr/core",
  handler: "select", # optional
  headers: [{"accept", "application/json"}], # optional
  options: [recv_timeout: 10000] # optional

config :hui, :updater,
  url: "http://localhost:8888/solr/core",
  handler: "update", # optional
  headers: [{"Content-Type", "application/json"}], # optional
  options: [recv_timeout: 10000] # optional

# Print only warnings and errors during test
config :logger, level: :warn
