class DropCandidates < ActiveRecord::Migration[5.2]
  def change
    drop_table :candidates
  end
end
