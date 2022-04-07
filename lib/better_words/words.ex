defmodule BetterWords.Words do
  @moduledoc """
  The Words context.
  """

  import Ecto.Query, warn: false
  alias BetterWords.Repo

  alias BetterWords.Words.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias BetterWords.Words.Worst_Word

  @doc """
  Returns the list of worst_words.

  ## Examples

      iex> list_worst_words()
      [%Worst_Word{}, ...]

  """
  def list_worst_words do
    Repo.all(Worst_Word)
  end

  @doc """
  Gets a single worst__word.

  Raises `Ecto.NoResultsError` if the Worst  word does not exist.

  ## Examples

      iex> get_worst__word!(123)
      %Worst_Word{}

      iex> get_worst__word!(456)
      ** (Ecto.NoResultsError)

  """
  def get_worst__word!(id), do: Repo.get!(Worst_Word, id)

  @doc """
  Creates a worst__word.

  ## Examples

      iex> create_worst__word(%{field: value})
      {:ok, %Worst_Word{}}

      iex> create_worst__word(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_worst__word(attrs \\ %{}) do
    %Worst_Word{}
    |> Worst_Word.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a worst__word.

  ## Examples

      iex> update_worst__word(worst__word, %{field: new_value})
      {:ok, %Worst_Word{}}

      iex> update_worst__word(worst__word, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_worst__word(%Worst_Word{} = worst__word, attrs) do
    worst__word
    |> Worst_Word.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a worst__word.

  ## Examples

      iex> delete_worst__word(worst__word)
      {:ok, %Worst_Word{}}

      iex> delete_worst__word(worst__word)
      {:error, %Ecto.Changeset{}}

  """
  def delete_worst__word(%Worst_Word{} = worst__word) do
    Repo.delete(worst__word)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking worst__word changes.

  ## Examples

      iex> change_worst__word(worst__word)
      %Ecto.Changeset{data: %Worst_Word{}}

  """
  def change_worst__word(%Worst_Word{} = worst__word, attrs \\ %{}) do
    Worst_Word.changeset(worst__word, attrs)
  end

  alias BetterWords.Words.BetterWord

  @doc """
  Returns the list of better_words.

  ## Examples

      iex> list_better_words()
      [%BetterWord{}, ...]

  """
  def list_better_words do
    Repo.all(BetterWord)
  end

  @doc """
  Gets a single better_word.

  Raises `Ecto.NoResultsError` if the Better word does not exist.

  ## Examples

      iex> get_better_word!(123)
      %BetterWord{}

      iex> get_better_word!(456)
      ** (Ecto.NoResultsError)

  """
  def get_better_word!(id), do: Repo.get!(BetterWord, id)

  @doc """
  Creates a better_word.

  ## Examples

      iex> create_better_word(%{field: value})
      {:ok, %BetterWord{}}

      iex> create_better_word(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_better_word(attrs \\ %{}) do
    %BetterWord{}
    |> BetterWord.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a better_word.

  ## Examples

      iex> update_better_word(better_word, %{field: new_value})
      {:ok, %BetterWord{}}

      iex> update_better_word(better_word, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_better_word(%BetterWord{} = better_word, attrs) do
    better_word
    |> BetterWord.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a better_word.

  ## Examples

      iex> delete_better_word(better_word)
      {:ok, %BetterWord{}}

      iex> delete_better_word(better_word)
      {:error, %Ecto.Changeset{}}

  """
  def delete_better_word(%BetterWord{} = better_word) do
    Repo.delete(better_word)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking better_word changes.

  ## Examples

      iex> change_better_word(better_word)
      %Ecto.Changeset{data: %BetterWord{}}

  """
  def change_better_word(%BetterWord{} = better_word, attrs \\ %{}) do
    BetterWord.changeset(better_word, attrs)
  end

  alias BetterWords.Words.Vote

  @doc """
  Returns the list of votes.

  ## Examples

      iex> list_votes()
      [%Vote{}, ...]

  """
  def list_votes do
    Repo.all(Vote)
  end

  @doc """
  Gets a single vote.

  Raises `Ecto.NoResultsError` if the Vote does not exist.

  ## Examples

      iex> get_vote!(123)
      %Vote{}

      iex> get_vote!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vote!(id), do: Repo.get!(Vote, id)

  @doc """
  Creates a vote.

  ## Examples

      iex> create_vote(%{field: value})
      {:ok, %Vote{}}

      iex> create_vote(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vote(attrs \\ %{}) do
    %Vote{}
    |> Vote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vote.

  ## Examples

      iex> update_vote(vote, %{field: new_value})
      {:ok, %Vote{}}

      iex> update_vote(vote, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vote(%Vote{} = vote, attrs) do
    vote
    |> Vote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vote.

  ## Examples

      iex> delete_vote(vote)
      {:ok, %Vote{}}

      iex> delete_vote(vote)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vote(%Vote{} = vote) do
    Repo.delete(vote)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vote changes.

  ## Examples

      iex> change_vote(vote)
      %Ecto.Changeset{data: %Vote{}}

  """
  def change_vote(%Vote{} = vote, attrs \\ %{}) do
    Vote.changeset(vote, attrs)
  end
end
