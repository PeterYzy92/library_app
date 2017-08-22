defmodule LibraryApp.Repo.Migrations.AddCategoryId do
  use Ecto.Migration

  def change do
    alter table(:books) do
    add :category_id, references(:categories)
    end
  end
end
