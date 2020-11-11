defmodule DigitalCollections.Catalog do
  alias DigitalCollections.Record
  alias DigitalCollections.Solr
  @moduledoc """
    A context holding functions for interacting with Solr.
  """

  @doc """
  returns whatever Hui returns which looks like {:ok, response} on a good day
  """
  def add(record = %Record{}) do
    Hui.update(:updater, [record |> Solr.Encoder.to_solr])
  end

  def get(id) do
    {:ok, %{body: %{"response" => %{"docs" => [record | _] }}}} = Hui.q("id:#{id}")
    Solr.Decoder.from_solr(record)
  end

  def search(query) do

  end
end
