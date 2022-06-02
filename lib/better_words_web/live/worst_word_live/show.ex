defmodule BetterWordsWeb.WorstWordLive.Show do
  use BetterWordsWeb, :live_view

  alias BetterWords.Words
  alias BetterWords.Words.BetterWord

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:worst_word, Words.get_worst_word!(id))
     |> apply_action(socket.assigns.live_action)
    }
  end

  def handle_params(_id, _, socket) do
    {:noreply, socket}
  end

  defp apply_action(socket, :new_better_word) do
    socket
    |> assign(:better_word, %BetterWord{})
  end

  defp apply_action(socket, _live_action), do: socket

  defp page_title(:show), do: "Show Worst word"
  defp page_title(:edit), do: "Edit Worst word"
  defp page_title(:new_better_word), do: "Add New Better Word"
end
