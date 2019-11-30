class CreateAddColumnIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_column_introduction_to_users do |t|
      add_column :users, :introduction, :text
      add_column :users, :profile_image_id, :text
    end
  end
end
