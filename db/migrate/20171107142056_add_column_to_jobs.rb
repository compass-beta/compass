class AddColumnToJobs < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :job_en, :string, after: :job
  end
end
