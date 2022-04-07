defmodule BetterWordsWeb.VoteLive.Index do
  use BetterWordsWeb, :live_view

  alias BetterWords.Words
  alias BetterWords.Words.Vote

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :votes, list_votes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Vote")
    |> assign(:vote, Words.get_vote!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Vote")
    |> assign(:vote, %Vote{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Votes")
    |> assign(:vote, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    vote = Words.get_vote!(id)
    {:ok, _} = Words.delete_vote(vote)

    {:noreply, assign(socket, :votes, list_votes())}
  end

  defp list_votes do
    Words.list_votes()
  end
end
