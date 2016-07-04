defmodule Gastronokids.Post do
  use Gastronokids.Web, :model 

  schema "posts" do
    field :name, :string
    field :address, :string
    field :body, :string

    timestamps()
  end

  @required_fields ~w(name address body)a
  @optional_fields ~w()a

  @doc """
  Creates a changeset based on the `struct` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3, max: 30)
  end
end
