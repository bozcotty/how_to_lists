class Step < ActiveRecord::Base
  belongs_to :list

  validates :item, presence: true
end
