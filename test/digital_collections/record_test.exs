defmodule RecordTest do
  use ExUnit.Case, async: true

  test "a record has fields" do
    record = %DigitalCollections.Record{
      id: "1",
      titles: ["My Book"],
      authors: ["Me"],
      subjects: ["computers", "hacky sack"]
    }

    assert record.id == "1"
    assert record.titles == ["My Book"]
    assert record.authors == ["Me"]
    assert record.subjects == ["computers", "hacky sack"]
  end
end
