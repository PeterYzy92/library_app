defmodule LibraryApp.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :language, :string
      add :age_group, :string
      
      timestamps()
    end
  end
end
