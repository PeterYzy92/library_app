defmodule LibraryApp.LoanView do
  use LibraryApp.Web, :view
  alias LibraryApp.{Repo, User, Loan}
  
  
  def username(user_id) do
    Repo.get(User, user_id).name  
  end

  def borrowdate(loan_id) do
    Repo.get(Loan, loan_id).borrow_date
  end
end
