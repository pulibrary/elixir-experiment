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
