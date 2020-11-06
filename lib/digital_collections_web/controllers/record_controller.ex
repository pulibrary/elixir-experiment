defmodule DigitalCollectionsWeb.RecordController do
  use DigitalCollectionsWeb, :controller

  alias DigitalCollections.Record

  def show(conn, %{"id" => id}) do
    record = DigitalCollections.Catalog.get(id)
    render(conn, "show.html", record: record)
  end
end
