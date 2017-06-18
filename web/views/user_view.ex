defmodule ClicheRumbl.UserView do
  use ClicheRumbl.Web, :view
  alias ClicheRumbl.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end
end