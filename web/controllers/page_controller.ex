defmodule ClicheRumbl.PageController do
  use ClicheRumbl.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
