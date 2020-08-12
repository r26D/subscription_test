defmodule SubscriptionTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      # adapter: Phoenix.PubSub.PG2
      {
        Phoenix.PubSub,
        name: SubscriptionTest.PubSub,
        adapter: Phoenix.PubSub.Redis,
        node_name: "subscription_test",
        url: "redis://localhost:6379/0"

      },
      SubscriptionTestWeb.Endpoint,
      {Absinthe.Subscription, SubscriptionTestWeb.Endpoint},
      # Starts a worker by calling: SubscriptionTest.Worker.start_link(arg)
      # {SubscriptionTest.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SubscriptionTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SubscriptionTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
