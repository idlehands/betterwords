defmodule BetterWords.Words do
  @moduledoc """
  The Words context.
  """

  import Ecto.Query, warn: false
  alias BetterWords.Repo
  alias BetterWords.Words.BetterWord
  alias BetterWords.Words.WorstWord

  @doc """
  Returns the list of worst_words.

  ## Examples

      iex> list_worst_words()
      [%WorstWord{}, ...]

  """
  def list_worst_words do
    Repo.all(WorstWord)
  end

  @doc """
  Gets a single worst_word.

  Raises `Ecto.NoResultsError` if the Worst word does not exist.

  ## Examples

      iex> get_worst_word!(123)
      %WorstWord{}

      iex> get_worst_word!(456)
      ** (Ecto.NoResultsError)

  """
  def get_worst_word!(id), do: Repo.get!(WorstWord, id)

  @doc """
  Creates a worst_word.

  ## Examples

      iex> create_worst_word(%{field: value})
      {:ok, %WorstWord{}}

      iex> create_worst_word(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_worst_word(attrs \\ %{}) do
    %WorstWord{}
    |> WorstWord.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a worst_word.

  ## Examples

      iex> update_worst_word(worst_word, %{field: new_value})
      {:ok, %WorstWord{}}

      iex> update_worst_word(worst_word, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_worst_word(%WorstWord{} = worst_word, attrs) do
    worst_word
    |> WorstWord.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a worst_word.

  ## Examples

      iex> delete_worst_word(worst_word)
      {:ok, %WorstWord{}}

      iex> delete_worst_word(worst_word)
      {:error, %Ecto.Changeset{}}

  """
  def delete_worst_word(%WorstWord{} = worst_word) do
    Repo.delete(worst_word)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking worst_word changes.

  ## Examples

      iex> change_worst_word(worst_word)
      %Ecto.Changeset{data: %WorstWord{}}

  """
  def change_worst_word(%WorstWord{} = worst_word, attrs \\ %{}) do
    WorstWord.changeset(worst_word, attrs)
  end

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
end
