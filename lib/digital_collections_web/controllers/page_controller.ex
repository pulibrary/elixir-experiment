defmodule DigitalCollectionsWeb.PageController do
  use DigitalCollectionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
