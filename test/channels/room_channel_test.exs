defmodule Gastronokids.RoomChannelTest do
  use Gastronokids.ChannelCase

  alias Gastronokids.RoomChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(RoomChannel, "rooms:lobby")

    {:ok, socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{"hello" => "there"}
    assert_reply ref, :ok, %{"hello" => "there"}
  end

  test "send new_msg", %{socket: socket} do
    push socket, "new_msg", %{"body" => "hello"}
    assert_broadcast "new_msg", %{"body" => "hello"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end
