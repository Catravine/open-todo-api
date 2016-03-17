class ListSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :permission, :user

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def user
    object.user.id
  end
end
