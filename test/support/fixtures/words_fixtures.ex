defmodule BetterWords.WordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BetterWords.Words` context.
  """

  @doc """
  Generate a worst_word.
  """
  def worst_word_fixture(attrs \\ %{}) do
    {:ok, worst_word} =
      attrs
      |> Enum.into(%{
        label: "some label",
        reason: "some reason",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> BetterWords.Words.create_worst_word()

    worst_word
  end
end
