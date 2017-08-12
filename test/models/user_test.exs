defmodule LibraryApp.UserTest do
  use LibraryApp.ModelCase

  alias LibraryApp.User

  @valid_attrs %{address: "some address", id: "some id", name: "some name", phone: "some phone"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
