defprotocol DigitalCollections.Solr.Encoder do
  @doc "Converts struct to a Solr record"
  def to_solr(record)
end
