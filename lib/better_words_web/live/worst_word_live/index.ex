defmodule BetterWordsWeb.WorstWordLive.Index do
  use BetterWordsWeb, :live_view

  alias BetterWords.Words
  alias BetterWords.Words.WorstWord

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
    |> assign(:page_title, "Edit Worst word")
    |> assign(:worst_word, Words.get_worst_word!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Worst word")
    |> assign(:worst_word, %WorstWord{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Worst words")
    |> assign(:worst_word, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    worst_word = Words.get_worst_word!(id)
    {:ok, _} = Words.delete_worst_word(worst_word)

    {:noreply, assign(socket, :worst_words, list_worst_words())}
  end

  def handle_event("random_number", _params, socket) do
    random_number = Enum.random(1..100)
    {:noreply, assign(socket, :random_number, random_number)}
  end

  defp list_worst_words do
    Words.list_worst_words()
  end
end
