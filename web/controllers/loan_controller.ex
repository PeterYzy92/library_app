defmodule LibraryApp.LoanController do
  use LibraryApp.Web, :controller

  alias LibraryApp.{Loan, Book, User}
  require IEx
  def index(conn, _params) do
    loans = Repo.all(Loan)
    render(conn, "index.html", loans: loans)
  end

  def new(conn, _params) do
    books = Repo.all(from b in Book)
     a = Enum.map(books, fn x -> {x.title, x.id} end) 
    # IEx.pry
    changeset = Loan.changeset(%Loan{})
    render(conn, "new.html", changeset: changeset, a: a)
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
    
    user_list = Repo.all(from u in User)

    render(conn, "return.html", users: user_list)
  end

  def return_list(conn, params) do
    user_id = params["user_id"]
    user = Repo.get(User, user_id)
    borrowed_books = Repo.all(
      from l in Loan, 
      join: b in Book, on: b.id == l.book_id,
      where: l.user_id == ^user_id,
      select: %{:id => l.id, :title => b.title }
      )

    # this should show a list of books borrowed by the user.

    render(conn, "return_list.html", borrowed_books: borrowed_books, user: user)
  end

   def return_user(conn, params) do
    loan_id = params["loan_id"]
    loan = Repo.get(Loan, loan_id)
    user = Repo.get(User, loan.user_id)
    book = Repo.get(Book, loan.book_id)
    x = Timex.now
    changeset = Loan.changeset(loan, %{:return_date => x})
    action = loan_path(conn, :update, loan_id)
    render(conn, "return_user.html", changeset: changeset, action: action, loan_id: loan_id, user: user, book: book)
    
  end



end
