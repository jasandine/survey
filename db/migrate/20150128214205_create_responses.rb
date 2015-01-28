class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.column :text, :string
      t.column :question_id, :integer

      t.timestamps null: false
    end
  end
end
