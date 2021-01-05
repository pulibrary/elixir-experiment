defmodule DigitalCollections.Results do
  @moduledoc """
    A struct that holds search results
  """
  defstruct [
    :total_hits,
    documents: [],
    facets: []
  ]
end
