defmodule LibraryApp.Category do
  use LibraryApp.Web, :model

  schema "categories" do
    field :language, :string
    field :age_group, :string
    has_many :books, LibraryApp.Book

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:language, :age_group])
    |> validate_required([:language, :age_group])
  end
end
