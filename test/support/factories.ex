defmodule DigitalCollections.Factories do
  @moduledoc """
  A module for factories.
  """
  use ExMachina

  def record_factory do
    %DigitalCollections.Record{
      id: sequence("id"),
      titles: [sequence("first title"), sequence("second title")],
      authors: [sequence("first author"), sequence("second author")],
      subjects: [sequence("first subject"), sequence("second subject")]
    }
  end
end
