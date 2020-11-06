defmodule CatalogTest do
  use ExUnit.Case

  test ".add" do
    record = %DigitalCollections.Record{
      id: "1",
      titles: ["My Book"],
      authors: ["Me"],
      subjects: ["computers", "hacky sack"]
    }

    {:ok, _response} = Catalog.add(record)
    record = Catalog.get(record.id)
    assert record.titles == ["My Book"]
  end
end
