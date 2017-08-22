defmodule LibraryApp.Book do
  use LibraryApp.Web, :model

  schema "books" do
    field :title, :string
    field :author, :string
    field :publisher, :string
    field :price, :string
    field :picture, :string
    field :isbn, :string
    belongs_to :user, LibraryApp.User
    belongs_to :category, LibraryApp.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :author, :publisher, :price, :picture, :isbn, :user_id, :category_id])
    |> validate_required([:title ])
  end
end
