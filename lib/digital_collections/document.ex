defmodule DigitalCollections.Document do
  @moduledoc """
    A struct that holds our document schema. used for presentation.
  """
  defstruct [
    :id,
    :titles,
    :authors,
    :subjects
  ]
end

defmodule DigitalCollections.Solr.Decoder do
  # We may have different kind of records for ingest purposes, but anything coming out of solr will just be a Document
  def from_solr(map) do
    %DigitalCollections.Document{
      id: map["id"],
      titles: map["titles_ssim"],
      authors: map["authors_ssim"],
      subjects: map["subjects_ssim"]
    }
  end
end
