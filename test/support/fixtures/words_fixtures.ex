defmodule BetterWords.WordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BetterWords.Words` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        uid: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> BetterWords.Words.create_user()

    user
  end

  @doc """
  Generate a worst__word.
  """
  def worst__word_fixture(attrs \\ %{}) do
    {:ok, worst__word} =
      attrs
      |> Enum.into(%{
        label: "some label",
        reason: "some reason",
        wid: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> BetterWords.Words.create_worst__word()

    worst__word
  end

  @doc """
  Generate a better_word.
  """
  def better_word_fixture(attrs \\ %{}) do
    {:ok, better_word} =
      attrs
      |> Enum.into(%{
        bid: "7488a646-e31f-11e4-aace-600308960662",
        label: "some label",
        reason: "some reason"
      })
      |> BetterWords.Words.create_better_word()

    better_word
  end

  @doc """
  Generate a vote.
  """
  def vote_fixture(attrs \\ %{}) do
    {:ok, vote} =
      attrs
      |> Enum.into(%{
        polarity: :"-1",
        vid: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> BetterWords.Words.create_vote()

    vote
  end
end
