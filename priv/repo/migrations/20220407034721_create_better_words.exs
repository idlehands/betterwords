defmodule BetterWords.Repo.Migrations.CreateBetterWords do
  use Ecto.Migration

  def change do
    create table(:better_words) do
      add :bid, :uuid
      add :label, :text
      add :reason, :text
      add :uid, references(:users, on_delete: :nothing)
      add :wid, references(:worst_words, on_delete: :nothing)

      timestamps()
    end

    create index(:better_words, [:uid])
    create index(:better_words, [:wid])
  end
end
