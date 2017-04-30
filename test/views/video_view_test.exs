defmodule ClicheRumbl.VideoViewTest do
  use ClicheRumbl.ConnCase, async: true

  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%ClicheRumbl.Video{id: "1", title: "dogs"},
              %ClicheRumbl.Video{id: "2", title: "cats"}]

    content = render_to_string(ClicheRumbl.VideoView, "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = ClicheRumbl.Video.changeset(%ClicheRumbl.Video{})
    categories = [{"cats", 123}]
    content = render_to_string(ClicheRumbl.VideoView, "new.html",
      conn: conn, changeset: changeset, categories: categories)

    assert String.contains?(content, "New video")
  end
end