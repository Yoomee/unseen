class RelatedItem < ActiveRecord::Base
  belongs_to :resouce, :polymorphic => true
  belongs_to :item, :polymorphic => true
end
