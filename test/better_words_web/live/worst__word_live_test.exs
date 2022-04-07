defmodule BetterWordsWeb.Worst_WordLiveTest do
  use BetterWordsWeb.ConnCase

  import Phoenix.LiveViewTest
  import BetterWords.WordsFixtures

  @create_attrs %{label: "some label", reason: "some reason", wid: "7488a646-e31f-11e4-aace-600308960662"}
  @update_attrs %{label: "some updated label", reason: "some updated reason", wid: "7488a646-e31f-11e4-aace-600308960668"}
  @invalid_attrs %{label: nil, reason: nil, wid: nil}

  defp create_worst__word(_) do
    worst__word = worst__word_fixture()
    %{worst__word: worst__word}
  end

  describe "Index" do
    setup [:create_worst__word]

    test "lists all worst_words", %{conn: conn, worst__word: worst__word} do
      {:ok, _index_live, html} = live(conn, Routes.worst__word_index_path(conn, :index))

      assert html =~ "Listing Worst words"
      assert html =~ worst__word.label
    end

    test "saves new worst__word", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.worst__word_index_path(conn, :index))

      assert index_live |> element("a", "New Worst  word") |> render_click() =~
               "New Worst  word"

      assert_patch(index_live, Routes.worst__word_index_path(conn, :new))

      assert index_live
             |> form("#worst__word-form", worst__word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#worst__word-form", worst__word: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.worst__word_index_path(conn, :index))

      assert html =~ "Worst  word created successfully"
      assert html =~ "some label"
    end

    test "updates worst__word in listing", %{conn: conn, worst__word: worst__word} do
      {:ok, index_live, _html} = live(conn, Routes.worst__word_index_path(conn, :index))

      assert index_live |> element("#worst__word-#{worst__word.id} a", "Edit") |> render_click() =~
               "Edit Worst  word"

      assert_patch(index_live, Routes.worst__word_index_path(conn, :edit, worst__word))

      assert index_live
             |> form("#worst__word-form", worst__word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#worst__word-form", worst__word: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.worst__word_index_path(conn, :index))

      assert html =~ "Worst  word updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes worst__word in listing", %{conn: conn, worst__word: worst__word} do
      {:ok, index_live, _html} = live(conn, Routes.worst__word_index_path(conn, :index))

      assert index_live |> element("#worst__word-#{worst__word.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#worst__word-#{worst__word.id}")
    end
  end

  describe "Show" do
    setup [:create_worst__word]

    test "displays worst__word", %{conn: conn, worst__word: worst__word} do
      {:ok, _show_live, html} = live(conn, Routes.worst__word_show_path(conn, :show, worst__word))

      assert html =~ "Show Worst  word"
      assert html =~ worst__word.label
    end

    test "updates worst__word within modal", %{conn: conn, worst__word: worst__word} do
      {:ok, show_live, _html} = live(conn, Routes.worst__word_show_path(conn, :show, worst__word))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Worst  word"

      assert_patch(show_live, Routes.worst__word_show_path(conn, :edit, worst__word))

      assert show_live
             |> form("#worst__word-form", worst__word: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#worst__word-form", worst__word: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.worst__word_show_path(conn, :show, worst__word))

      assert html =~ "Worst  word updated successfully"
      assert html =~ "some updated label"
    end
  end
end
