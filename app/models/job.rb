class Job < ApplicationRecord
  validates :title, :quantity, :place, :salary, :content, :start_date, :end_date, presence: true

  scope :newest, ->{order :end_date}
  scope :available, -> {where("? BETWEEN start_date AND end_date", Date.current)}

  has_many :job_comments, dependent: :destroy
end
