defmodule LibraryApp.LoanController do
  use LibraryApp.Web, :controller

  alias LibraryApp.Loan
  alias LibraryApp.{Repo, User, Book}
  
  require IEx
  def index(conn, _params) do
    loans = Repo.all(Loan)
    render(conn, "index.html", loans: loans)
  end

  def new(conn, _params) do
    x = Timex.now
    changeset = Loan.changeset(%Loan{}, %{:borrow_date => x})
    userquery = from u in User
    users = Repo.all(userquery)
    bookquery = from b in Book
    books = Repo.all(bookquery)
    render(conn, "new.html", changeset: changeset, 
    user_id: Enum.map(users, fn x -> {x.name, x.id} end), book_id: Enum.map(books, fn x -> {x.title, x.id} end))
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
    
    x = Timex.now
    changeset = Loan.changeset(Repo.get(Loan, params["id"]), %{:return_date => x})
    action = loan_path(conn, :update, params["id"])
    userquery = from u in User
    users = Repo.all(userquery)
    bookquery = from b in Book
    books = Repo.all(bookquery)

    render(conn, "return.html", changeset: changeset, action: action, loan_id: params["id"], user_id: Enum.map(users, fn x -> {x.name, x.id} end) , book_id: Enum.map(books, fn x -> {x.title, x.id} end))
    
  end


end
