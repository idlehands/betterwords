defmodule BetterWordsWeb.Worst_WordLive.FormComponent do
  use BetterWordsWeb, :live_component

  alias BetterWords.Words

  @impl true
  def update(%{worst__word: worst__word} = assigns, socket) do
    changeset = Words.change_worst__word(worst__word)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"worst__word" => worst__word_params}, socket) do
    changeset =
      socket.assigns.worst__word
      |> Words.change_worst__word(worst__word_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"worst__word" => worst__word_params}, socket) do
    save_worst__word(socket, socket.assigns.action, worst__word_params)
  end

  defp save_worst__word(socket, :edit, worst__word_params) do
    case Words.update_worst__word(socket.assigns.worst__word, worst__word_params) do
      {:ok, _worst__word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Worst  word updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_worst__word(socket, :new, worst__word_params) do
    case Words.create_worst__word(worst__word_params) do
      {:ok, _worst__word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Worst  word created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
