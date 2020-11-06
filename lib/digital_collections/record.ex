defmodule DigitalCollections.Record do
  @moduledoc """
    A struct that holds our record schema
  """
  defstruct [
    :id,
    :titles,
    :authors,
    :subjects
  ]
end

# TODO: rename to encoder
defimpl Catalog.Solr.Mapper, for: DigitalCollections.Record do
  def to_solr(record) do
    %{
      id: record.id,
      titles_ssim: record.titles,
      authors_ssim: record.authors,
      subjects_ssim: record.subjects
    }
  end
end

defmodule Catalog.Solr.Decoder do
    # We may have different kind of records for ingest purposes, but anything coming out of solr will just be a Record, so we define the decoding here in this file.
  def from_solr(map) do
    %DigitalCollections.Record{
      id: map["id"],
      titles: map["titles_ssim"],
      authors: map["authors_ssim"],
      subjects: map["subjects_ssim"]
    }
  end
end
