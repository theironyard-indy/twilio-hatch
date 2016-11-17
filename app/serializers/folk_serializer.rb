class FolkSerializer < ActiveModel::Serializer
  attributes :id, :name, :initial_message, :message_count

  has_many :messages

  def initial_message
    object.message
  end
end
