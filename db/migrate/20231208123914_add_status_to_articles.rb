class AddStatusToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :boolean
  end
end
