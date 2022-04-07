# BetterWords

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Generating LiveView, templates, and context
```code iex
mix phx.gen.live Words User users uid:uuid name:text
mix ecto.migrate
mix phx.gen.live Words Worst_Word worst_words wid:uuid label:text reason:text uid:references:users
mix ecto.migrate
mix phx.gen.live Words BetterWord better_words bid:uuid label:text reason:text uid:references:users wid:references:worst_words
mix ecto.migrate
mix phx.gen.live Words Vote votes vid:uuid uid:references:users bid:references:better_words polarity:enum:-1:0:1
mix ecto.migrate
```

[phx.gen.live](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Live.html)
[phx.gen.schema](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Schema.html)

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
