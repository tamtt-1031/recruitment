class AddColumnsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :job_title, :string
    add_column :jobs, :cv_content, :text
    add_column :jobs, :recruiment_type, :string
    add_column :jobs, :job_benefit, :text
    add_column :jobs, :job_requirement, :text
  end
end
