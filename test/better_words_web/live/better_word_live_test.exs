defmodule BetterWordsWeb.BetterWordLiveTest do
  use BetterWordsWeb.ConnCase

  import Phoenix.LiveViewTest
  import BetterWords.WordsFixtures

  @create_attrs %{label: "some label", reason: "some reason", user_id: "7488a646-e31f-11e4-aace-600308960662", worst_word_id: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{label: "some updated label", reason: "some updated reason", user_id: "7488a646-e31f-11e4-aace-600308960668", worst_word_id: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{label: nil, reason: nil, user_id: nil, worst_word_id: nil}

  defp create_better_word(_) do
    better_word = better_word_fixture()
    %{better_word: better_word}
  end

  describe "Index" do
    setup [:create_better_word]

    test "lists all better_words", %{conn: conn, better_word: better_word} do
      {:ok, _index_live, html} = live(conn, Routes.better_word_index_path(conn, :index))

      assert html =~ "Listing Better words"
      assert html =~ better_word.label
    end

    test "saves new better_word", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.better_word_index_path(conn, :index))

      assert index_live |> element("a", "New Better word") |> render_click() =~
               "New Better word"

      assert_patch(index_live, Routes.better_word_index_path(conn, :new))

      assert index_live
             |> form("#better_word-form", better_word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#better_word-form", better_word: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.better_word_index_path(conn, :index))

      assert html =~ "Better word created successfully"
      assert html =~ "some label"
    end

    test "updates better_word in listing", %{conn: conn, better_word: better_word} do
      {:ok, index_live, _html} = live(conn, Routes.better_word_index_path(conn, :index))

      assert index_live |> element("#better_word-#{better_word.id} a", "Edit") |> render_click() =~
               "Edit Better word"

      assert_patch(index_live, Routes.better_word_index_path(conn, :edit, better_word))

      assert index_live
             |> form("#better_word-form", better_word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#better_word-form", better_word: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.better_word_index_path(conn, :index))

      assert html =~ "Better word updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes better_word in listing", %{conn: conn, better_word: better_word} do
      {:ok, index_live, _html} = live(conn, Routes.better_word_index_path(conn, :index))

      assert index_live |> element("#better_word-#{better_word.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#better_word-#{better_word.id}")
    end
  end

  describe "Show" do
    setup [:create_better_word]

    test "displays better_word", %{conn: conn, better_word: better_word} do
      {:ok, _show_live, html} = live(conn, Routes.better_word_show_path(conn, :show, better_word))

      assert html =~ "Show Better word"
      assert html =~ better_word.label
    end

    test "updates better_word within modal", %{conn: conn, better_word: better_word} do
      {:ok, show_live, _html} = live(conn, Routes.better_word_show_path(conn, :show, better_word))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Better word"

      assert_patch(show_live, Routes.better_word_show_path(conn, :edit, better_word))

      assert show_live
             |> form("#better_word-form", better_word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#better_word-form", better_word: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.better_word_show_path(conn, :show, better_word))

      assert html =~ "Better word updated successfully"
      assert html =~ "some updated label"
    end
  end
end
