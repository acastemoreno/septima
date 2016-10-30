# Septima

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## config/dev.secret.ex
```elixir
use Mix.Config

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "cambiame",
  client_secret: "cambiame"

config :guardian, Guardian,
    allowed_algos: ["ES512"], # optional
    verify_module: Guardian.JWT,  # optional
    issuer: "Septimo",
    ttl: { 30, :days },
    verify_issuer: true, # optional
    secret_key: %{"Holi, cambiame"},
    serializer: Septima.GuardianSerializer,
    permissions: %{
     default: [:read, :write],
     admin: [:dashboard, :make_payments]
    }
```
## Gen secret_key
```elixir
$ iex -S mix
iex(1)> jwk = JOSE.JWS.generate_key(%{"alg" => "ES512"})
iex(2)> jwk |> JOSE.JWK.to_map |> elem(1)
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
