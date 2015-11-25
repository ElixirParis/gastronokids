defmodule Gastronokids.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :address, :string
      add :body, :string

      timestamps
    end

  end
end
