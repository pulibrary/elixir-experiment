require IEx
defmodule Catalog do
  alias DigitalCollections.Record
  @moduledoc """
    A context holding functions for interacting with Solr.
  """

  @doc """
  returns whatever Hui returns which looks like {:ok, response} on a good day
  """
  def add(record = %Record{}) do
    output = Hui.update(:updater, [record |> Catalog.Solr.Mapper.to_solr])
  end

  def get(id) do
    {:ok, %{body: %{"response" => %{"docs" => [record | _] }}}} = Hui.q("id:#{id}")
    Catalog.Solr.Decoder.from_solr(record)
  end
end
