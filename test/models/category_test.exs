defmodule LibraryApp.CategoryTest do
  use LibraryApp.ModelCase

  alias LibraryApp.Category

<<<<<<< HEAD
  @valid_attrs %{age_group: "some age_group", language: "some language"}
=======
  @valid_attrs %{age_group: "some age_group", lauagage: "some lauagage"}
>>>>>>> 2706965a79bd141f386b51b9c5c01dc676cdb959
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
