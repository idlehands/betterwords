defmodule BetterWords.WordsTest do
  use BetterWords.DataCase

  alias BetterWords.Words

  describe "users" do
    alias BetterWords.Words.User

    import BetterWords.WordsFixtures

    @invalid_attrs %{name: nil, uid: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Words.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Words.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", uid: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %User{} = user} = Words.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.uid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", uid: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %User{} = user} = Words.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.uid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_user(user, @invalid_attrs)
      assert user == Words.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Words.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Words.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Words.change_user(user)
    end
  end

  describe "worst_words" do
    alias BetterWords.Words.Worst_Word

    import BetterWords.WordsFixtures

    @invalid_attrs %{label: nil, reason: nil, wid: nil}

    test "list_worst_words/0 returns all worst_words" do
      worst__word = worst__word_fixture()
      assert Words.list_worst_words() == [worst__word]
    end

    test "get_worst__word!/1 returns the worst__word with given id" do
      worst__word = worst__word_fixture()
      assert Words.get_worst__word!(worst__word.id) == worst__word
    end

    test "create_worst__word/1 with valid data creates a worst__word" do
      valid_attrs = %{label: "some label", reason: "some reason", wid: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Worst_Word{} = worst__word} = Words.create_worst__word(valid_attrs)
      assert worst__word.label == "some label"
      assert worst__word.reason == "some reason"
      assert worst__word.wid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_worst__word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_worst__word(@invalid_attrs)
    end

    test "update_worst__word/2 with valid data updates the worst__word" do
      worst__word = worst__word_fixture()
      update_attrs = %{label: "some updated label", reason: "some updated reason", wid: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Worst_Word{} = worst__word} = Words.update_worst__word(worst__word, update_attrs)
      assert worst__word.label == "some updated label"
      assert worst__word.reason == "some updated reason"
      assert worst__word.wid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_worst__word/2 with invalid data returns error changeset" do
      worst__word = worst__word_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_worst__word(worst__word, @invalid_attrs)
      assert worst__word == Words.get_worst__word!(worst__word.id)
    end

    test "delete_worst__word/1 deletes the worst__word" do
      worst__word = worst__word_fixture()
      assert {:ok, %Worst_Word{}} = Words.delete_worst__word(worst__word)
      assert_raise Ecto.NoResultsError, fn -> Words.get_worst__word!(worst__word.id) end
    end

    test "change_worst__word/1 returns a worst__word changeset" do
      worst__word = worst__word_fixture()
      assert %Ecto.Changeset{} = Words.change_worst__word(worst__word)
    end
  end

  describe "better_words" do
    alias BetterWords.Words.BetterWord

    import BetterWords.WordsFixtures

    @invalid_attrs %{bid: nil, label: nil, reason: nil}

    test "list_better_words/0 returns all better_words" do
      better_word = better_word_fixture()
      assert Words.list_better_words() == [better_word]
    end

    test "get_better_word!/1 returns the better_word with given id" do
      better_word = better_word_fixture()
      assert Words.get_better_word!(better_word.id) == better_word
    end

    test "create_better_word/1 with valid data creates a better_word" do
      valid_attrs = %{bid: "7488a646-e31f-11e4-aace-600308960662", label: "some label", reason: "some reason"}

      assert {:ok, %BetterWord{} = better_word} = Words.create_better_word(valid_attrs)
      assert better_word.bid == "7488a646-e31f-11e4-aace-600308960662"
      assert better_word.label == "some label"
      assert better_word.reason == "some reason"
    end

    test "create_better_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_better_word(@invalid_attrs)
    end

    test "update_better_word/2 with valid data updates the better_word" do
      better_word = better_word_fixture()
      update_attrs = %{bid: "7488a646-e31f-11e4-aace-600308960668", label: "some updated label", reason: "some updated reason"}

      assert {:ok, %BetterWord{} = better_word} = Words.update_better_word(better_word, update_attrs)
      assert better_word.bid == "7488a646-e31f-11e4-aace-600308960668"
      assert better_word.label == "some updated label"
      assert better_word.reason == "some updated reason"
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

  describe "votes" do
    alias BetterWords.Words.Vote

    import BetterWords.WordsFixtures

    @invalid_attrs %{polarity: nil, vid: nil}

    test "list_votes/0 returns all votes" do
      vote = vote_fixture()
      assert Words.list_votes() == [vote]
    end

    test "get_vote!/1 returns the vote with given id" do
      vote = vote_fixture()
      assert Words.get_vote!(vote.id) == vote
    end

    test "create_vote/1 with valid data creates a vote" do
      valid_attrs = %{polarity: :"-1", vid: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Vote{} = vote} = Words.create_vote(valid_attrs)
      assert vote.polarity == :"-1"
      assert vote.vid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_vote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Words.create_vote(@invalid_attrs)
    end

    test "update_vote/2 with valid data updates the vote" do
      vote = vote_fixture()
      update_attrs = %{polarity: :"0", vid: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Vote{} = vote} = Words.update_vote(vote, update_attrs)
      assert vote.polarity == :"0"
      assert vote.vid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_vote/2 with invalid data returns error changeset" do
      vote = vote_fixture()
      assert {:error, %Ecto.Changeset{}} = Words.update_vote(vote, @invalid_attrs)
      assert vote == Words.get_vote!(vote.id)
    end

    test "delete_vote/1 deletes the vote" do
      vote = vote_fixture()
      assert {:ok, %Vote{}} = Words.delete_vote(vote)
      assert_raise Ecto.NoResultsError, fn -> Words.get_vote!(vote.id) end
    end

    test "change_vote/1 returns a vote changeset" do
      vote = vote_fixture()
      assert %Ecto.Changeset{} = Words.change_vote(vote)
    end
  end
end
