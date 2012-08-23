class SetPublicationDateOnPages < ActiveRecord::Migration
  def up
    Page.where('publication_date IS NULL').each { |page| page.update_attribute(:publication_date,  page.created_at) }
  end

  def down
  end
end
