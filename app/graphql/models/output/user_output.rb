Models::Output::UserOutput = GraphQL::ObjectType.define do
  name "User"
  field :id, types.Int
  field :name, types.String
  field :email, types.String
  field :username, types.String
  field :endorsees do
    type types[Models::Output::UserOutput]
    resolve ->(obj, args, ctx) {
      obj.endorsees.map(&:endorsee)
    }
  end
  field :endorsers do
    type types[Models::Output::UserOutput]
    resolve ->(obj, args, ctx) {
      obj.endorsers.map(&:endorser)
    }
  end
end