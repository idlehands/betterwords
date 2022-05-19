defmodule BetterWords.WordsTest do
  use BetterWords.DataCase

  alias BetterWords.Words

  describe "worst_words" do
    alias BetterWords.Words.WorstWord

    import BetterWords.WordsFixtures

    @invalid_attrs %{label: nil, reason: nil, user_id: nil}

    test "list_worst_words/0 returns all worst_words" do
      worst_word = worst_word_fixture()
      assert Words.list_worst_words() == [worst_word]
    end

    test "get_worst_word!/1 returns the worst_word with given id" do
      worst_word = worst_word_fixture()
      assert Words.get_worst_word!(worst_word.id) == worst_word
    end

    test "create_worst_word/1 with valid data creates a worst_word" do
      valid_attrs = %{label: "some label", reason: "some reason", user_id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %WorstWord{} = worst_word} = Words.create_worst_word(valid_attrs)
      assert worst_word.label == "some label"
      assert worst_word.reason == "some reason"

    end

    test "create_worst_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_worst_word(@invalid_attrs)
    end

    test "update_worst_word/2 with valid data updates the worst_word" do
      worst_word = worst_word_fixture()
      update_attrs = %{label: "some updated label", reason: "some updated reason", user_id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %WorstWord{} = worst_word} = Words.update_worst_word(worst_word, update_attrs)
      assert worst_word.label == "some updated label"
      assert worst_word.reason == "some updated reason"

    end

    test "update_worst_word/2 with invalid data returns error changeset" do
      worst_word = worst_word_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_worst_word(worst_word, @invalid_attrs)
      assert worst_word == Words.get_worst_word!(worst_word.id)
    end

    test "delete_worst_word/1 deletes the worst_word" do
      worst_word = worst_word_fixture()
      assert {:ok, %WorstWord{}} = Words.delete_worst_word(worst_word)
      assert_raise Ecto.NoResultsError, fn -> Words.get_worst_word!(worst_word.id) end
    end

    test "change_worst_word/1 returns a worst_word changeset" do
      worst_word = worst_word_fixture()
      assert %Ecto.Changeset{} = Words.change_worst_word(worst_word)
    end
  end

  describe "better_words" do
    alias BetterWords.Words.BetterWord

    import BetterWords.WordsFixtures

    @invalid_attrs %{label: nil, reason: nil, user_id: nil, worst_word_id: nil}

    test "list_better_words/0 returns all better_words" do
      better_word = better_word_fixture()
      assert Words.list_better_words() == [better_word]
    end

    test "get_better_word!/1 returns the better_word with given id" do
      better_word = better_word_fixture()
      assert Words.get_better_word!(better_word.id) == better_word
    end

    test "create_better_word/1 with valid data creates a better_word" do
      valid_attrs = %{label: "some label", reason: "some reason", user_id: "7488a646-e31f-11e4-aace-600308960662", worst_word_id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %BetterWord{} = better_word} = Words.create_better_word(valid_attrs)
      assert better_word.label == "some label"
      assert better_word.reason == "some reason"
      assert better_word.user_id == "7488a646-e31f-11e4-aace-600308960662"
      assert better_word.worst_word_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_better_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_better_word(@invalid_attrs)
    end

    test "update_better_word/2 with valid data updates the better_word" do
      better_word = better_word_fixture()
      update_attrs = %{label: "some updated label", reason: "some updated reason", user_id: "7488a646-e31f-11e4-aace-600308960668", worst_word_id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %BetterWord{} = better_word} = Words.update_better_word(better_word, update_attrs)
      assert better_word.label == "some updated label"
      assert better_word.reason == "some updated reason"
      assert better_word.user_id == "7488a646-e31f-11e4-aace-600308960668"
      assert better_word.worst_word_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_better_word/2 with invalid data returns error changeset" do
      better_word = better_word_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_better_word(better_word, @invalid_attrs)
      assert better_word == Words.get_better_word!(better_word.id)
    end

    test "delete_better_word/1 deletes the better_word" do
      better_word = better_word_fixture()
      assert {:ok, %BetterWord{}} = Words.delete_better_word(better_word)
      assert_raise Ecto.NoResultsError, fn -> Words.get_better_word!(better_word.id) end
    end

    test "change_better_word/1 returns a better_word changeset" do
      better_word = better_word_fixture()
      assert %Ecto.Changeset{} = Words.change_better_word(better_word)
    end
  end
end
