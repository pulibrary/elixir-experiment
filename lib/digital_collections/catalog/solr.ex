defprotocol Catalog.Solr.Mapper do
  @doc "Converts struct to a Solr record"
  def to_solr(record)
end
