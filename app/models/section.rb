class Section < ApplicationRecord

  enum repeat_type: [:everyday, :mwf, :tt], _prefix: true

  belongs_to :teacher
  belongs_to :subject
  belongs_to :room
  has_and_belongs_to_many :students, dependent: :destroy

  validates :start_at, :end_at, :teacher_id, :subject_id, :room_id, presence: true

  before_save :set_weekdays

  def set_weekdays
    case repeat_type
    when 'everyday'
      self.weekdays = [1, 2, 3, 4, 5].join(',')
    when 'mwf'
      self.weekdays = [1, 3, 5].join(',')
    when 'tt'
      self.weekdays = [2, 4].join(',')
    end
  end
end
