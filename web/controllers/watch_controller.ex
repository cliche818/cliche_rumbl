defmodule ClicheRumbl.WatchController do
  use ClicheRumbl.Web, :controller
  alias ClicheRumbl.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end