defmodule BetterWords.Repo.Migrations.CreateWorstWords do
  use Ecto.Migration

  def change do
    create table(:worst_words, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :label, :string
      add :user_id, :uuid
      add :reason, :text

      timestamps()
    end
  end
end
