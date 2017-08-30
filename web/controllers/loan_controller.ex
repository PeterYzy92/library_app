defmodule LibraryApp.LoanController do
  use LibraryApp.Web, :controller

  alias LibraryApp.Loan

  def index(conn, _params) do
    loans = Repo.all(Loan)
    render(conn, "index.html", loans: loans)
  end

  def new(conn, _params) do
    changeset = Loan.changeset(%Loan{}, %{:borrow_date => Timex.now, :due_date => Timex.shift(Timex.now, weeks: 2)})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"loan" => loan_params}) do
    changeset = Loan.changeset(%Loan{}, loan_params)

    case Repo.insert(changeset) do
      {:ok, loan} ->
        conn
        |> put_flash(:info, "Loan created successfully.")
        |> redirect(to: loan_path(conn, :show, loan))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loan = Repo.get!(Loan, id)
    render(conn, "show.html", loan: loan)
  end

  def edit(conn, %{"id" => id}) do
    loan = Repo.get!(Loan, id)
    changeset = Loan.changeset(loan)
    render(conn, "edit.html", loan: loan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "loan" => loan_params}) do
    loan = Repo.get!(Loan, id)
    changeset = Loan.changeset(loan, loan_params)

    case Repo.update(changeset) do
      {:ok, loan} ->
        conn
        |> put_flash(:info, "Loan updated successfully.")
        |> redirect(to: loan_path(conn, :show, loan))
      {:error, changeset} ->
        render(conn, "edit.html", loan: loan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loan = Repo.get!(Loan, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(loan)

    conn
    |> put_flash(:info, "Loan deleted successfully.")
    |> redirect(to: loan_path(conn, :index))
  end

  def return(conn, params) do
    title2 = "Return Function"
    changeset = Loan.changeset(%Loan{}, %{:return_date => Timex.now})
    action = loan_path(conn, :create)
    render(conn, "return.html", title3: title2, changeset: changeset, action: action)
  end
end

