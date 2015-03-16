class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
    	t.string :word
    end
  end
end
