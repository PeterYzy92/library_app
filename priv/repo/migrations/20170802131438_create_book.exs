defmodule LibraryApp.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :publisher, :string
      add :price, :string
      add :picture, :string
      add :isbn, :string

      timestamps()
    end
  end
end
