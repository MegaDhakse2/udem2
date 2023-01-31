class RenameColumnArticleCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :article_categories, :category_id, :variety_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
