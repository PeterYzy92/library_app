defmodule LibraryApp.Loan do
  use LibraryApp.Web, :model

  schema "loans" do
    field :borrow_date, :date
    field :return_date, :date
    field :due_date, :date
    field :overdue_fee, :decimal
    belongs_to :user, LibraryApp.User, foreign_key: :user_id
    belongs_to :book, LibraryApp.Book
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:borrow_date, :return_date, :due_date, :overdue_fee, :book_id, :user_id])
    |> validate_required([:borrow_date, :return_date, :due_date, :user_id, :book_id])
  end
end
