defmodule Gastronokids.RoomChannel do
  use Gastronokids.Web, :channel
  alias Gastronokids.Presence

  def join("rooms:lobby", payload, socket) do
    if authorized?(payload) do
      send self(), :after_join
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_info(:after_join, socket) do
    Presence.track(socket, socket.assigns.user_id, %{
          device: "browser",
          online_at: inspect(:os.timestamp())
                         })
    push socket, "presence_state", Presence.list(socket)
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("new_msg", payload, socket) do
    payloadWithUser = %{"body" => payload["body"], "user": socket.assigns.user_id}
    broadcast! socket, "new_msg", payloadWithUser
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
