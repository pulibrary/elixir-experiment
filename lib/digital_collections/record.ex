defmodule DigitalCollections.Record do
  @moduledoc """
    A struct that holds our record schema
  """
  defstruct [
    :id,
    :title,
    :author,
    :subjects
  ]
end
