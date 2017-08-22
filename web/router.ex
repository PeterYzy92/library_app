defmodule LibraryApp.Router do
  use LibraryApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LibraryApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/books", BookController
     resources "/users", UserController
     resources "/categories", CategoryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", LibraryApp do
  #   pipe_through :api
  # end
end
