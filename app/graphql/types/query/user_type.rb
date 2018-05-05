Types::Query::UserType = GraphQL::ObjectType.define do
  name 'Query'

  field :getUser, Models::Output::UserOutput do
    description 'An endpoint to get a user by id'
    argument :id, !types.Int
    resolve ->(obj, args, ctx) {
      ::User.find(args[:id])
    }
  end
end
