defmodule ClicheRumbl.UserController do
  use ClicheRumbl.Web, :controller

  def index(conn, _params) do
    users = Repo.all(ClicheRumbl.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(ClicheRumbl.User, id)
    render conn, "show.html", user: user
  end
end