class RenameTags < ActiveRecord::Migration
  def up
    Tag.find_by_name('interview').update_attribute(:name, 'interviews') if Tag.find_by_name('interview')
    Tag.find_by_name('talent').update_attribute(:name, 'foam-talent') if Tag.find_by_name('talent')
    Tag.find_by_name('offprint').update_attribute(:name, 'offprint-book-fair') if Tag.find_by_name('offprint')
    Tag.find_by_name('fair-festival').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('fair-festival')
    Tag.find_by_name('helsinki').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('helsinki')
    Tag.find_by_name('foam-editions').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('foam-editions')
    Tag.find_by_name('foam-for-you').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('foam-for-you')
    Tag.find_by_name('photography-books').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('photography-books')
    Tag.find_by_name('stedelijk-museum').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('stedelijk-museum')
    Tag.find_by_name('w-m-hunt').taggings.where('context != "categories"').each {|tagging| tagging.destroy} if Tag.find_by_name('w-m-hunt')
  end

  def down
    Tag.find_by_name('interviews').update_attribute(:name, 'interview') if Tag.find_by_name('interviews')
    Tag.find_by_name('foam-talent').update_attribute(:name, 'talent') if Tag.find_by_name('foam-talent')
    Tag.find_by_name('offprint-book-fair').update_attribute(:name, 'offprint') if Tag.find_by_name('offprint-book-fair')
    
  end
end
