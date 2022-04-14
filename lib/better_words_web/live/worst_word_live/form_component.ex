defmodule BetterWordsWeb.WorstWordLive.FormComponent do
  use BetterWordsWeb, :live_component

  alias BetterWords.Words

  @impl true
  def update(%{worst_word: worst_word} = assigns, socket) do
    changeset = Words.change_worst_word(worst_word)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"worst_word" => worst_word_params}, socket) do
    changeset =
      socket.assigns.worst_word
      |> Words.change_worst_word(worst_word_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"worst_word" => worst_word_params}, socket) do
    save_worst_word(socket, socket.assigns.action, worst_word_params)
  end

  defp save_worst_word(socket, :edit, worst_word_params) do
    case Words.update_worst_word(socket.assigns.worst_word, worst_word_params) do
      {:ok, _worst_word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Worst word updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_worst_word(socket, :new, worst_word_params) do
    case Words.create_worst_word(worst_word_params) do
      {:ok, _worst_word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Worst word created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
