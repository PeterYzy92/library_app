defmodule LibraryApp.Category do
  use LibraryApp.Web, :model

  schema "categories" do
<<<<<<< HEAD
    field :language, :string
    field :age_group, :string
=======

    field :language, :string
    field :age_group, :string

>>>>>>> 07574f51e4fc796baa465fc9a9faab48eb9a55d7
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

    |> cast(params, [:language, :age_group])
    |> validate_required([:language, :age_group])

>>>>>>> 07574f51e4fc796baa465fc9a9faab48eb9a55d7
  end
end
