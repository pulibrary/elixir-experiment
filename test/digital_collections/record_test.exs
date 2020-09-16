defmodule RecordTest do
  use ExUnit.Case

  test "a record has fields" do
    record = %DigitalCollections.Record{
      id: "1",
      title: "My Book",
      author: "Me",
      subjects: ["computers", "hacky sack"]
    }
    assert record.id == "1"
    assert record.title == "My Book"
    assert record.author == "Me"
    assert record.subjects == ["computers", "hacky sack"]
  end
end
