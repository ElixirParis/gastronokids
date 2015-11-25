defmodule Gastronokids.PostTest do
  use Gastronokids.ModelCase

  alias Gastronokids.Post

  @valid_attrs %{address: "some content", body: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
