class Job < ApplicationRecord
  validates :title, :quantity, :place, :salary, :start_date, 
            :company_name, :job_title, :cv_content,
            :job_benefit, :job_requirement,
            :recruiment_type,  :end_date, presence: true

  scope :newest, ->{order :end_date}
  scope :available, -> {where("? BETWEEN start_date AND end_date", Date.current)}

  has_many :job_comments, dependent: :destroy
end
