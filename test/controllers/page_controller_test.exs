defmodule Gastronokids.PageControllerTest do
  use Gastronokids.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
