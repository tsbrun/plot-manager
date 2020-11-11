class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.string :title
      t.string :summary
      t.integer :user_id
    end
  end
end
