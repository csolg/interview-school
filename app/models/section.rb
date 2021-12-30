class Section < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :room
end
