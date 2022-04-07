defmodule BetterWords.Repo.Migrations.CreateWorstWords do
  use Ecto.Migration

  def change do
    create table(:worst_words) do
      add :wid, :uuid
      add :label, :text
      add :reason, :text
      add :uid, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:worst_words, [:uid])
  end
end
