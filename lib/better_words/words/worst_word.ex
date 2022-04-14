defmodule BetterWords.Words.WorstWord do
  use BetterWords.Schema

  schema "worst_words" do
    field :label, :string
    field :reason, :string
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(worst_word, attrs) do
    worst_word
    |> cast(attrs, [:label, :user_id, :reason])
    |> validate_required([:label, :user_id, :reason])
  end
end
