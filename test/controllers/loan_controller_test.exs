defmodule LibraryApp.LoanControllerTest do
  use LibraryApp.ConnCase

  alias LibraryApp.Loan
  @valid_attrs %{borrow_date: ~D[2010-04-17], due_date: ~D[2010-04-17], overdue_fee: "120.5", return_date: ~D[2010-04-17]}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, loan_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing loans"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, loan_path(conn, :new)
    assert html_response(conn, 200) =~ "New loan"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, loan_path(conn, :create), loan: @valid_attrs
    loan = Repo.get_by!(Loan, @valid_attrs)
    assert redirected_to(conn) == loan_path(conn, :show, loan.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, loan_path(conn, :create), loan: @invalid_attrs
    assert html_response(conn, 200) =~ "New loan"
  end

  test "shows chosen resource", %{conn: conn} do
    loan = Repo.insert! %Loan{}
    conn = get conn, loan_path(conn, :show, loan)
    assert html_response(conn, 200) =~ "Show loan"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, loan_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    loan = Repo.insert! %Loan{}
    conn = get conn, loan_path(conn, :edit, loan)
    assert html_response(conn, 200) =~ "Edit loan"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    loan = Repo.insert! %Loan{}
    conn = put conn, loan_path(conn, :update, loan), loan: @valid_attrs
    assert redirected_to(conn) == loan_path(conn, :show, loan)
    assert Repo.get_by(Loan, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    loan = Repo.insert! %Loan{}
    conn = put conn, loan_path(conn, :update, loan), loan: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit loan"
  end

  test "deletes chosen resource", %{conn: conn} do
    loan = Repo.insert! %Loan{}
    conn = delete conn, loan_path(conn, :delete, loan)
    assert redirected_to(conn) == loan_path(conn, :index)
    refute Repo.get(Loan, loan.id)
  end
end
