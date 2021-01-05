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

  # TODO: configuration shouldn't live here
  def facet_order do
    %{
      "authors_ssim" => %{
        "label" => "Authors",
        "sort_key" => 0
      },
      "subjects_ssim" => %{
        "label" => "Subjects",
        "sort_key" => 1
      }
    }
  end

  # TODO: order by sort_key
  # TODO: also, refactor stuff
  def to_facet(facets) do
    facets
    |> Enum.to_list()
    |> Enum.map(&facet_label_lookup/1)
  end

  def facet_label_lookup({key, counts}) do
    {facet_order[key]["label"], convert_counts(counts)}
  end

  def convert_counts(counts) do
    counts
    |> Enum.chunk_every(2)
    |> Enum.map(fn [a, b] -> {a, b} end)
  end
end
