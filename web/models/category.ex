defmodule LibraryApp.Category do
  use LibraryApp.Web, :model

  schema "categories" do
    field :lauagage, :string
    field :age_group, :string
    belongs_to :book, LibraryApp.Book
    has_many :books, LibraryApp.Book

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:lauagage, :age_group, :book_id])
    |> validate_required([:lauagage, :age_group])
  end
end
