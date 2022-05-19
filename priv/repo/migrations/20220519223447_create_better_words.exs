defmodule BetterWords.Repo.Migrations.CreateBetterWords do
  use Ecto.Migration

  def change do
    create table(:better_words, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :label, :string
      add :user_id, :uuid
      add :reason, :string
      add :worst_word_id, :uuid

      timestamps()
    end
  end
end
