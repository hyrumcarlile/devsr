Models::Output::UserOutput = GraphQL::ObjectType.define do
  name 'User'
  field :id, types.Int
  field :name, types.String
  field :email, types.String
  field :username, types.String
end
