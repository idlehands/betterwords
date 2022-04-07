defmodule BetterWords.Repo.Migrations.CreateVotes do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :vid, :uuid
      add :polarity, :string
      add :uid, references(:users, on_delete: :nothing)
      add :bid, references(:better_words, on_delete: :nothing)

      timestamps()
    end

    create index(:votes, [:uid])
    create index(:votes, [:bid])
  end
end
