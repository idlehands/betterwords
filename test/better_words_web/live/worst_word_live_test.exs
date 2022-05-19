defmodule BetterWordsWeb.WorstWordLiveTest do
  use BetterWordsWeb.ConnCase

  import Phoenix.LiveViewTest
  import BetterWords.WordsFixtures

  @create_attrs %{label: "some label", reason: "some reason"}
  @update_worst_words_attrs %{label: "some updated label", reason: "some updated reason"}
  @update_better_words_attrs %{label: "updated label", reason: "updated reason", user: "59fa8bc4-acd4-468f-95a3-e28a62d2af84", worst_word: "59fa8bc4-acd4-468f-95a3-e28a62d2af84"}
  @invalid_worst_words_attrs %{label: nil, reason: nil}
  @invalid_better_words_attrs %{label: nil, reason: nil}

  defp create_worst_word(_) do
    worst_word = worst_word_fixture()
    %{worst_word: worst_word}
  end

  describe "Index" do
    setup [:create_worst_word]

    test "lists all worst_words", %{conn: conn, worst_word: worst_word} do
      {:ok, _index_live, html} = live(conn, Routes.worst_word_index_path(conn, :index))

      assert html =~ "Listing Worst words"
      assert html =~ worst_word.label
    end

    test "saves new worst_word", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.worst_word_index_path(conn, :index))

      assert index_live |> element("a", "New Worst word") |> render_click() =~
               "New Worst word"

      assert_patch(index_live, Routes.worst_word_index_path(conn, :new))

      assert index_live
             |> form("#worst_word-form", worst_word: @invalid_worst_words_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#worst_word-form", worst_word: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.worst_word_index_path(conn, :index))

      assert html =~ "Worst word created successfully"
      assert html =~ "some label"
    end

    test "updates worst_word in listing", %{conn: conn, worst_word: worst_word} do
      {:ok, index_live, _html} = live(conn, Routes.worst_word_index_path(conn, :index))

      assert index_live |> element("#worst_word-#{worst_word.id} a", "Edit") |> render_click() =~
               "Edit Worst word"

      assert_patch(index_live, Routes.worst_word_index_path(conn, :edit, worst_word))

      assert index_live
             |> form("#worst_word-form", worst_word: @invalid_worst_words_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#worst_word-form", worst_word: @update_worst_words_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.worst_word_index_path(conn, :index))

      assert html =~ "Worst word updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes worst_word in listing", %{conn: conn, worst_word: worst_word} do
      {:ok, index_live, _html} = live(conn, Routes.worst_word_index_path(conn, :index))

      assert index_live |> element("#worst_word-#{worst_word.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#worst_word-#{worst_word.id}")
    end
  end

  describe "Show" do
    setup [:create_worst_word]

    test "displays worst_word", %{conn: conn, worst_word: worst_word} do
      {:ok, _show_live, html} = live(conn, Routes.worst_word_show_path(conn, :show, worst_word))

      assert html =~ "Show Worst word"
      assert html =~ worst_word.label
    end

    test "updates worst_word within modal", %{conn: conn, worst_word: worst_word} do
      {:ok, show_live, _html} = live(conn, Routes.worst_word_show_path(conn, :show, worst_word))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Worst word"

      assert_patch(show_live, Routes.worst_word_show_path(conn, :edit, worst_word))

      assert show_live
             |> form("#worst_word-form", worst_word: @invalid_worst_words_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#worst_word-form", worst_word: @update_worst_words_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.worst_word_show_path(conn, :show, worst_word))

      assert html =~ "Worst word updated successfully"
      assert html =~ "some updated label"
    end

    test "abiltity to add BetterWord within modal", %{conn: conn, worst_word: worst_word} do
      {:ok, show_live, _html} = live(conn, Routes.worst_word_show_path(conn, :show, worst_word))

      assert show_live |> element("a", "Add") |> render_click()

      assert_patch(show_live, Routes.better_word_index_path(conn, :new))

      assert show_live
      |> form("#better_word-form", better_word: @invalid_better_words_attrs)
      |> render_change() =~ "can&#39;t be blank"


      {:ok, _, html} =
      show_live
      |> form("#better_word-form", better_word: @update_better_words_attrs)
      |> render_submit()
      |> follow_redirect(conn, Routes.worst_word_show_path(conn, :show, worst_word))

    end

  end
end
