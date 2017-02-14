defmodule ClicheRumbl.UserView do
  use ClicheRumbl.Web, :view
  alias ClicheRumbl.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end