defmodule SubscriptionTestWeb.Router do
  use SubscriptionTestWeb, :router

  scope "/graphiql" do
    forward "/", Absinthe.Plug.GraphiQL,
      schema: SubscriptionTestWeb.Schema,
      interface: :playground,
      context: %{pubsub: SubscriptionTestWeb.Endpoint},
      socket: SubscriptionTestWeb.UserSocket
  end

  scope "/graphql" do
    forward "/", Absinthe.Plug, schema: SubscriptionTestWeb.Schema
  end
end
