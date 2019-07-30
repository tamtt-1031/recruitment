class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :department
      t.string :person_in_charge
      t.string :phone_number
      t.string :email
      t.string :prefecture
      t.string :address
      t.text :content
      t.integer :contact_status, default: 0

      t.timestamps
    end
  end
end
