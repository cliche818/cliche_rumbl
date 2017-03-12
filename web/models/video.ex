defmodule ClicheRumbl.Video do
  use ClicheRumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, ClicheRumbl.User
    belongs_to :category, ClicheRumbl.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  @required_fields ~w(url title description)
  @optional_fields  ~w(category_id)

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
  end
end