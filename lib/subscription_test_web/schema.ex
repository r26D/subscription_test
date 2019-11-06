defmodule SubscriptionTestWeb.Schema do
  use Absinthe.Schema

  object :user do
    field :name, non_null(:string)
  end

  subscription do
    field :user_created, :user do
      config fn _, _ ->
        {:ok, topic: "users"}
      end
    end
  end

  query do
    field :users, type: list_of(:user) do
      resolve fn _, _ -> {:ok, [%{name: "John"}]} end
    end
  end
end
