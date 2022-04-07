defmodule BetterWordsWeb.Worst_WordLive.Index do
  use BetterWordsWeb, :live_view

  alias BetterWords.Words
  alias BetterWords.Words.Worst_Word

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :worst_words, list_worst_words())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Worst  word")
    |> assign(:worst__word, Words.get_worst__word!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Worst  word")
    |> assign(:worst__word, %Worst_Word{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Worst words")
    |> assign(:worst__word, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    worst__word = Words.get_worst__word!(id)
    {:ok, _} = Words.delete_worst__word(worst__word)

    {:noreply, assign(socket, :worst_words, list_worst_words())}
  end

  defp list_worst_words do
    Words.list_worst_words()
  end
end
