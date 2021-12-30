class Section < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :room

  validates :duration, :start_at, :teacher_id, :subject_id, :room_id, presence: true
end
