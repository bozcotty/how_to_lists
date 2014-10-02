class List < ActiveRecord::Base
  has_many :steps, dependent: :destroy

  validates :title, presence: true, length: { minimum: 4}

end
