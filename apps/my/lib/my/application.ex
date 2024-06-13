defmodule My.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      My.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: My.PubSub},
      # Start Finch
      {Finch, name: My.Finch}
      # Start a worker by calling: My.Worker.start_link(arg)
      # {My.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: My.Supervisor)
  end
end
