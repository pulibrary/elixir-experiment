defmodule DigitalCollectionsWeb.RecordController do
  use DigitalCollectionsWeb, :controller

  alias DigitalCollections.Record

  def show(conn, %{"id" => id}) do
    record = %Record{id: id}
    render(conn, "show.html", record: record)
  end
end
