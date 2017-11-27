defmodule CallThruWeb.Router do
  use CallThruWeb, :router

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

  scope "/", CallThruWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/switches", SwitchController
    resources "/lines", LineController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CallThruWeb do
  #   pipe_through :api
  # end
end
