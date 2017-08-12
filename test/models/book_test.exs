defmodule LibraryApp.BookTest do
  use LibraryApp.ModelCase

  alias LibraryApp.Book

  @valid_attrs %{author: "some author", isbn: "some isbn", picture: "some picture", price: "some price", publisher: "some publisher", title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attrs)
    refute changeset.valid?
  end
end
