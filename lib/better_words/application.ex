defmodule BetterWords.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BetterWords.Repo,
      # Start the Telemetry supervisor
      BetterWordsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BetterWords.PubSub},
      # Start the Endpoint (http/https)
      BetterWordsWeb.Endpoint
      # Start a worker by calling: BetterWords.Worker.start_link(arg)
      # {BetterWords.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BetterWords.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BetterWordsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
