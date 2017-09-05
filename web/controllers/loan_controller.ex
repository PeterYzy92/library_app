defmodule LibraryApp.LoanController do
  use LibraryApp.Web, :controller

  alias LibraryApp.{Loan, Book, User}
  require IEx
  def index(conn, _params) do
    loans = Repo.all(Loan)
    render(conn, "index.html", loans: loans)
  end

  def new(conn, _params) do
    
    query = from b in Book
    query1 = from u in User
    a = Repo.all(query)
    a = Enum.map(a, fn x -> {x.title, x.id} end)
    u = Repo.all(query1)
    u = Enum.map(u, fn x -> {x.name, x.id} end)
    # IEx.pry
    changeset = Loan.changeset(%Loan{})
    render(conn, "new.html", changeset: changeset, a: a, u: u)
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
    #IEx.pry
    title = "Return Function"
    x = Timex.now
    changeset = Loan.changeset(Repo.get(Loan, params["id"]), %{:return_date => x})
    action = loan_path(conn, :update, params["id"])
    query = from b in Book
    b = Repo.all(query)
    b = Enum.map(b, fn x -> {x.title, x.id} end)
    query1 = from u in User
    u = Repo.all(query1)
    u = Enum.map(u, fn x -> {x.name, x.id} end)
    render(conn, "return.html", changeset: changeset, action: action, loan_id: params["id"], b: b, u: u)
    
    end
end
