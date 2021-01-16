class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, :null=>false, :limit=>150
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
