defmodule CatalogTest do
  use ExUnit.Case, async: true
  alias DigitalCollections.{Record, Catalog, Document}

  test ".add" do
    record = %Record{
      id: "1",
      titles: ["My Book"],
      authors: ["Me"],
      subjects: ["computers", "hacky sack"]
    }

    {:ok, _response} = Catalog.add(record)
  end

  test ".get" do
    record = %Record{
      id: "1",
      titles: ["My Book"],
      authors: ["Me"],
      subjects: ["computers", "hacky sack"]
    }

    {:ok, _response} = Catalog.add(record)

    document = Catalog.get(record.id)
    %Document{} = document
    assert document.titles == ["My Book"]
  end
end
