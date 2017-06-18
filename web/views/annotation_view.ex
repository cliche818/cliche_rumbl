defmodule ClicheRumbl.AnnotationView do
  use ClicheRumbl.Web, :view

  def render("annotation.json", %{annotation: ann}) do
    %{
      id: ann.id,
      body: ann.body,
      at: ann.at,
      user: render_one(ann.user, ClicheRumbl.UserView, "user.json")
    }
  end
end