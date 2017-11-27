defmodule CallThruWeb.PageController do
  use CallThruWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
