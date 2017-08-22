defmodule LibraryApp.LoanView do
  use LibraryApp.Web, :view
  alias LibraryApp.{Repo, User}
  
  def username(user_id) do
    Repo.get(User, user_id).name  
  end
end
