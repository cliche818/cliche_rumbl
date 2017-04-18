defmodule ClicheRumbl.PageControllerTest do
  use ClicheRumbl.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Rumbl.io!"
  end
end
