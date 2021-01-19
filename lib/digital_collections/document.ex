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
  @typedoc """
    Individual solr facet extracted from a solr response. Includes the key name, facet value, and the number of hits after the facet name in the list.
    e.g: { "authors_ssim", ["first author", 30, "second author", 10] }
  """
  @type solr_facet() :: { String.t(), list(String.t() | integer()) }

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
        "sort_key" => 1
      },
      "subjects_ssim" => %{
        "label" => "Subjects",
        "sort_key" => 0
      }
    }
  end

  # TODO: also, refactor stuff
  def to_facet(facets) do
    facets
    |> Enum.to_list()
    |> Enum.sort_by(&facet_sort_key/1)
    |> Enum.map(&facet_label_lookup/1)
  end

  @spec facet_sort_key(solr_facet()) :: integer()
  def facet_sort_key(facet) do
    facet_order()[facet |> elem(0)]["sort_key"]
  end

  def facet_label_lookup({key, counts}) do
    {facet_order()[key]["label"], convert_counts(counts)}
  end

  def convert_counts(counts) do
    counts
    |> Enum.chunk_every(2)
    |> Enum.map(fn [a, b] -> {a, b} end)
  end
end
