class MessageSerializer < ActiveModel::Serializer
  attributes :body
  has_one :folk
end
