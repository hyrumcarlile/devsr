module Utils
  # This allows us to seperate out GraphQL queries into separate
  # files.
  class FieldCombiner
    def self.combine(query_types)
      Array(query_types).inject({}) do |acc, query_type|
        acc.merge!(query_type.fields)
      end
    end
  end
end
