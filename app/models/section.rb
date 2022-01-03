class Section < ApplicationRecord

  enum repeat_type: [:everyday, :mwf, :tt], _prefix: true

  belongs_to :teacher
  belongs_to :subject
  belongs_to :room

  validates :start_at, :end_at, :teacher_id, :subject_id, :room_id, presence: true
end
