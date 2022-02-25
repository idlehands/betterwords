defmodule BetterWords.Repo do
  use Ecto.Repo,
    otp_app: :better_words,
    adapter: Ecto.Adapters.Postgres
end
