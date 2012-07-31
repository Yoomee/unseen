class ChangeNameOfFestivalTag < ActiveRecord::Migration
  def up
    Tag.find_by_name("festival").update_attribute(:name, "fair-festival")
  end

  def down
    Tag.find_by_name("fair-festival").update_attribute(:name, "festival")
  end
end
