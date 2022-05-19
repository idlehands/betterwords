defmodule BetterWordsWeb.BetterWordLive.Show do
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
     |> assign(:better_word, Words.get_better_word!(id))}
  end

  defp page_title(:show), do: "Show Better word"
  defp page_title(:edit), do: "Edit Better word"
end
