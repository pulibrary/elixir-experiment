require IEx
defmodule Catalog do
  alias DigitalCollections.Record
  @moduledoc """
    A context holding functions for interacting with Solr.
  """
  def add(record = %Record{}) do
    output = Hui.update(:updater, [record |> Catalog.Solr.Mapper.to_solr])
    IEx.pry
    {:ok}
  end

  def get(id) do
  end
end
