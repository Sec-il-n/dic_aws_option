class ChangeDataTypeImageOfFeeds < ActiveRecord::Migration[5.2]
  def change
    change_column :feeds, :image, :string
  end
end
