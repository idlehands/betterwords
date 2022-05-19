defmodule BetterWords.Words.BetterWord do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "better_words" do
    field :label, :string
    field :reason, :string
    field :user_id, Ecto.UUID
    field :worst_word_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(better_word, attrs) do
    better_word
    |> cast(attrs, [:label, :user_id, :reason, :worst_word_id])
    |> validate_required([:label, :user_id, :reason, :worst_word_id])
  end
end
