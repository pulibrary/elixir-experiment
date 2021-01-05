defmodule DigitalCollections.Catalog do
  alias DigitalCollections.{Record, Solr, Results}

  @moduledoc """
    A context holding functions for interacting with Solr.
  """

  @doc """
  returns whatever Hui returns which looks like {:ok, response} on a good day
  """
  def add(record = %Record{}) do
    Hui.update(:updater, [record |> Solr.Encoder.to_solr()])
  end

  def get(id) do
    {:ok, %{body: %{"response" => %{"docs" => [record | _]}}}} = Hui.q("id:#{id}")
    Solr.Decoder.from_solr(record)
  end

  def delete(:all) do
    Hui.delete_by_query(:updater, "*:*")
  end

  def search(:all) do
    {:ok, %{body: solr_body}} =
      Hui.q(q: "*", qt: "search", facet: true, "facet.field": ["authors_ssim", "subjects_ssim"])

    solr_body |> to_results
  end

  def to_results(solr_body) do
    %Results{
      total_hits: solr_body["response"]["numFound"],
      documents: solr_body["response"]["docs"] |> Enum.map(&Solr.Decoder.from_solr/1),
      facets: solr_body["facet_counts"]["facet_fields"] |> Solr.Decoder.to_facet()
    }
  end
end
