defmodule ClicheRumbl.Video do
  use ClicheRumbl.Web, :model

  @primary_key {:id, ClicheRumbl.Permalink, autogenerate: true}

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :slug, :string
    has_many :annotations, ClicheRumbl.Annotation

    belongs_to :user, ClicheRumbl.User
    belongs_to :category, ClicheRumbl.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  @required_fields ~w(url title description)
  @optional_fields  ~w(category_id)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> slugify_title()
    |> assoc_constraint(:category)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end

  defimpl Phoenix.Param, for: ClicheRumbl.Video do
    def to_param(%{slug: slug, id: id}) do
      "#{id}-#{slug}"
    end
  end
end