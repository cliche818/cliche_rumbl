defmodule ClicheRumbl.Repo do
  @moduledoc """
  In memory repository
  """

  def all(ClicheRumbl.User) do
    [%ClicheRumbl.User{id: "1", name: "Jeff", username: "Cliche818", password: "123456"},
    %ClicheRumbl.User{id: "2", name: "User2", username: "User2", password: "123456" },
    %ClicheRumbl.User{id: "3", name: "User3", username: "User3", password: "123456" },]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
