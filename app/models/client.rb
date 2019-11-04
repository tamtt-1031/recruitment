class Client < ApplicationRecord
  enum contact_status: [:not_contact, :contacted]

  validates :company_name, :person_in_charge, :email, :phone_number, :prefecture, :address, :content, presence: true

  scope :order_by_contact_status, -> {order :contact_status}
  scope :order_newest, -> {order created_at: :desc}
end
