class AddPublicationIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :publication_id, :integer
  end
end
