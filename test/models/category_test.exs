defmodule LibraryApp.CategoryTest do
  use LibraryApp.ModelCase

  alias LibraryApp.Category

<<<<<<< HEAD
  @valid_attrs %{age_group: "some age_group", language: "some language"}
=======

  @valid_attrs %{age_group: "some age_group", language: "some language"}

>>>>>>> 07574f51e4fc796baa465fc9a9faab48eb9a55d7
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Category.changeset(%Category{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Category.changeset(%Category{}, @invalid_attrs)
    refute changeset.valid?
  end
end
