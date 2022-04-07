defmodule BetterWordsWeb.Worst_WordLive.Show do
  use BetterWordsWeb, :live_view

  alias BetterWords.Words

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:worst__word, Words.get_worst__word!(id))}
  end

  defp page_title(:show), do: "Show Worst  word"
  defp page_title(:edit), do: "Edit Worst  word"
end
