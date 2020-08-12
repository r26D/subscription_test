# SubscriptionTest

This was originally built to debug an issue with phoenix_pubsub_redis - https://github.com/absinthe-graphql/absinthe_phoenix/issues/63

I'm updating it to the 1.5 version to troubleshoot my own issues with subscriptions

```sh
$ asdf install
$ mix deps.get
# start redis
$ docker-compose up -d redis
# start the server
$ iex -S mix phx.server
```

Now subscribe in your browse at http://localhost:4001/graphiql
```graphql
subscription {
  userCreated {
    name
  }
}
```

```
iex> Absinthe.Subscription.publish(SubscriptionTestWeb.Endpoint, %{name: "Mary"}, user_created: "users")
```
