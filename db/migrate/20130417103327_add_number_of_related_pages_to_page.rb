class AddNumberOfRelatedPagesToPage < ActiveRecord::Migration
  def change
    add_column :pages, :number_of_related_pages, :integer
  end
end
