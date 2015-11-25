defmodule Gastronokids.Post do
  use Gastronokids.Web, :model

  schema "posts" do
    field :name, :string
    field :address, :string
    field :body, :string

    timestamps
  end

  @required_fields ~w(name address body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 3, max: 30)
  end
end
