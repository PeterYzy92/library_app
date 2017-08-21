defmodule LibraryApp.Category do
  use LibraryApp.Web, :model

  schema "categories" do
<<<<<<< HEAD
    field :language, :string
    field :age_group, :string
=======
    field :lauagage, :string
    field :age_group, :string
    belongs_to :book, LibraryApp.Book
>>>>>>> 2706965a79bd141f386b51b9c5c01dc676cdb959
    has_many :books, LibraryApp.Book

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
<<<<<<< HEAD
    |> cast(params, [:language, :age_group])
    |> validate_required([:language, :age_group])
=======
    |> cast(params, [:lauagage, :age_group, :book_id])
    |> validate_required([:lauagage, :age_group])
>>>>>>> 2706965a79bd141f386b51b9c5c01dc676cdb959
  end
end
