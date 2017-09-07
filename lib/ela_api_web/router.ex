defmodule ElaApiWeb.Router do
  use ElaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElaApiWeb do
    pipe_through :api

    resources "/people", PersonController, except: [:new, :edit] do
      resources "/facts", FactController, except: [:new, :edit]
    end

    resources "/facts", FactController, only: [:index, :show]
  end
end
