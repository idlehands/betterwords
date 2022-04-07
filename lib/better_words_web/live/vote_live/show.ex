defmodule BetterWordsWeb.VoteLive.Show do
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
     |> assign(:vote, Words.get_vote!(id))}
  end

  defp page_title(:show), do: "Show Vote"
  defp page_title(:edit), do: "Edit Vote"
end
