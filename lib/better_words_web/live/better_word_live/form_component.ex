defmodule BetterWordsWeb.BetterWordLive.FormComponent do
  use BetterWordsWeb, :live_component

  alias BetterWords.Words

  @impl true
  def update(%{better_word: better_word} = assigns, socket) do
    changeset = Words.change_better_word(better_word)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"better_word" => better_word_params}, socket) do
    changeset =
      socket.assigns.better_word
      |> Words.change_better_word(better_word_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"better_word" => better_word_params}, socket) do
    save_better_word(socket, socket.assigns.action, better_word_params)
  end

  defp save_better_word(socket, :edit, better_word_params) do
    case Words.update_better_word(socket.assigns.better_word, better_word_params) do
      {:ok, _better_word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Better word updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_better_word(socket, :new, better_word_params) do
    case Words.create_better_word(better_word_params) do
      {:ok, _better_word} ->
        {:noreply,
         socket
         |> put_flash(:info, "Better word created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
