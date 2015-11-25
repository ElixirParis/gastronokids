defmodule Gastronokids.PageController do
  use Gastronokids.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
