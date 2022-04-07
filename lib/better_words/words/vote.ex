defmodule BetterWords.Words.Vote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "votes" do
    field :polarity, Ecto.Enum, values: [:"-1", :"0", :"1"]
    field :vid, Ecto.UUID
    field :uid, :id
    field :bid, :id

    timestamps()
  end

  @doc false
  def changeset(vote, attrs) do
    vote
    |> cast(attrs, [:vid, :polarity])
    |> validate_required([:vid, :polarity])
  end
end
