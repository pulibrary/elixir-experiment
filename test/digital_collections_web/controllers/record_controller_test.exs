defmodule DigitalCollectionsWeb.RecordControllerTest do
  use DigitalCollectionsWeb.ConnCase

  test "GET /record/:id", %{conn: conn} do
    conn = get(conn, "/record/123")
    assert html_response(conn, 200) =~ "It's record 123"
  end
end
