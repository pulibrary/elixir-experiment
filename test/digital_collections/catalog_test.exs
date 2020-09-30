defmodule CatalogTest do
  use ExUnit.Case

  test ".add" do
    record = %DigitalCollections.Record{
      id: "1",
      title: "My Book",
      author: "Me",
      subjects: ["computers", "hacky sack"]
    }

    {:ok} = Catalog.add(record)
    record = Catalog.get(record.id)
    assert record.title == "My Book"
  end
end
