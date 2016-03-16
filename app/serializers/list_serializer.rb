class ListSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :user

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
