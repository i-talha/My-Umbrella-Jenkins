defmodule Accounts.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AccountsWeb.Telemetry,
      # Start the Ecto repository
      Accounts.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Accounts.PubSub},
      # Start Finch
      {Finch, name: Accounts.Finch},
      # Start the Endpoint (http/https)
      AccountsWeb.Endpoint
      # Start a worker by calling: Accounts.Worker.start_link(arg)
      # {Accounts.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Accounts.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AccountsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
