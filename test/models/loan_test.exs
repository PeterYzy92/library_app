defmodule LibraryApp.LoanTest do
  use LibraryApp.ModelCase

  alias LibraryApp.Loan

  @valid_attrs %{borrow_date: ~D[2010-04-17], due_date: ~D[2010-04-17], overdue_fee: "120.5", return_date: ~D[2010-04-17]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Loan.changeset(%Loan{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Loan.changeset(%Loan{}, @invalid_attrs)
    refute changeset.valid?
  end
end
