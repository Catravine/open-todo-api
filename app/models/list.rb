class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  before_save { self.permission ||= :open }

  validates :title, presence: true

  enum permission: [:open, :viewable, :non_public]

end
