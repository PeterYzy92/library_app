defmodule LibraryApp.Repo.Migrations.CreateLoan do
  use Ecto.Migration

  def change do
    create table(:loans) do
      add :borrow_date, :date
      add :return_date, :date
      add :due_date, :date
      add :overdue_fee, :decimal
      add :user_id, references(:users, on_delete: :nothing)
      add :book_id, references(:books, on_delete: :nothing)
      timestamps()
    end

    create index(:loans, [:user_id])
  end
end
