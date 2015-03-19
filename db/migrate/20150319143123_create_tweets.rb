class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
		t.string :text
		t.string :user_id
		t.string :user_name
		t.string :user_screen_name
		t.string :user_image_url
		t.string :tweet_id
		t.datetime :tweet_created_at
		t.references :keyword  #references sets up a foreign key between the two models (same as keyword_id)
      t.timestamps 
    end
  end
end
