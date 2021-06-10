defmodule Newsfeed.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Newsfeed.Repo,
      # Start the Telemetry supervisor
      NewsfeedWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Newsfeed.PubSub},
      # Start the Endpoint (http/https)
      NewsfeedWeb.Endpoint
      # Start a worker by calling: Newsfeed.Worker.start_link(arg)
      # {Newsfeed.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Newsfeed.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NewsfeedWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
