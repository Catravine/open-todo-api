class ItemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :completed, :list

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def list
    object.list.id
  end
end
