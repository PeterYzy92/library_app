defmodule LibraryApp.PageController do
  use LibraryApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
