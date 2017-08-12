defmodule LibraryApp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :phone, :string
      add :address, :string

      timestamps()
    end
  end
end
