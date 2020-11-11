defmodule DigitalCollectionsWeb.RecordControllerTest do
  alias DigitalCollections.Record
  use DigitalCollectionsWeb.ConnCase, async: true

  test "GET /record/:id", %{conn: conn} do
    DigitalCollections.Catalog.add(%Record{id: "321", titles: ["I'm a record"] })
    conn = get(conn, "/record/321")
    assert html_response(conn, 200) =~ "It's record 321"
    assert html_response(conn, 200) =~ "I'm a record"
  end
end
