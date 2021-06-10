# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :newsfeed,
  ecto_repos: [Newsfeed.Repo]

# Configures the endpoint
config :newsfeed, NewsfeedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RPALfPmBTGuvNpUUAZCE+0cpQx/73bOPGRKijo83SGGl7MkzY92mQgWl0DPzKYQD",
  render_errors: [view: NewsfeedWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Newsfeed.PubSub,
  live_view: [signing_salt: "PlggVyMg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Kafka consumer config
config :kaffe,
       consumer: [
         endpoints: [localhost: 9092],
         topics: ["newsfeed"],     # the topic(s) that will be consumed
         consumer_group: "learning-elixir",   # the consumer group for tracking offsets in Kafka
         message_handler: Newsfeed.Consumer,           # the module that will process messages
       ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"