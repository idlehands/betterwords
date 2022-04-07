defmodule BetterWords.Words.BetterWord do
  use Ecto.Schema
  import Ecto.Changeset

  schema "better_words" do
    field :bid, Ecto.UUID
    field :label, :string
    field :reason, :string
    field :uid, :id
    field :wid, :id

    timestamps()
  end

  @doc false
  def changeset(better_word, attrs) do
    better_word
    |> cast(attrs, [:bid, :label, :reason])
    |> validate_required([:bid, :label, :reason])
  end
end
