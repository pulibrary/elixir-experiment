defmodule SolrCase do
  use ExUnit.CaseTemplate

  setup do
    DigitalCollections.Catalog.delete(:all)
    {:ok, []}
  end
end
