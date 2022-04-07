defmodule BetterWords.Words.Worst_Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "worst_words" do
    field :label, :string
    field :reason, :string
    field :wid, Ecto.UUID
    field :uid, :id

    timestamps()
  end

  @doc false
  def changeset(worst__word, attrs) do
    worst__word
    |> cast(attrs, [:wid, :label, :reason])
    |> validate_required([:wid, :label, :reason])
  end
end
