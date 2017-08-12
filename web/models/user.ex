defmodule LibraryApp.User do
  use LibraryApp.Web, :model

  schema "users" do
    field :name, :string
    field :phone, :string
    field :address, :string
    has_many :books, LibraryApp.Book

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :phone, :address])
    |> validate_required([:name, :phone, :address])
  end
end
