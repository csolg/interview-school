class Room < ApplicationRecord
  has_many :sections, dependent: :destroy
end
