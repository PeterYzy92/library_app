defmodule LibraryApp.Repo.Migrations.AddCategoryId do
  use Ecto.Migration

  def change do
  	alter table(:categories) do 
  		add :book_id, references(:books)
  	end
  end
end
