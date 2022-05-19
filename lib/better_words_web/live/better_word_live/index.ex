defmodule BetterWordsWeb.BetterWordLive.Index do
  use BetterWordsWeb, :live_view

  alias BetterWords.Words
  alias BetterWords.Words.BetterWord

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :better_words, list_better_words())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Better word")
    |> assign(:better_word, Words.get_better_word!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Better word")
    |> assign(:better_word, %BetterWord{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Better words")
    |> assign(:better_word, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    better_word = Words.get_better_word!(id)
    {:ok, _} = Words.delete_better_word(better_word)

    {:noreply, assign(socket, :better_words, list_better_words())}
  end

  defp list_better_words do
    Words.list_better_words()
  end
end
