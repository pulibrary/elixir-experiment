defmodule CatalogTest do
  use SolrCase
  import DigitalCollections.Factories
  alias DigitalCollections.{Record, Catalog, Document, Results}

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

  test ".delete" do
    build(:record) |> Catalog.add()

    Catalog.delete(:all)

    results = %Results{} = Catalog.search(:all)
    assert results.total_hits == 0
  end

  test ".search" do
    build_list(5, :record) |> Enum.map(&Catalog.add/1)
    results = %Results{} = Catalog.search(:all)
    assert results.total_hits == 5
    assert results.documents |> length == 5
    %Document{} = results.documents |> hd
  end
end
