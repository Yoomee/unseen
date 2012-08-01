# Don't delete comments, they are used in gems for adding abilities
class Ability
  
  include CanCan::Ability
  
  def initialize(user)
    
    # open ability
    can :create, Enquiry
    can [:show, :set_view], Page, :draft => false
    can :read, :photographer
    
    if user.try(:admin?)
      can :manage, :all
      # admin ability
    elsif user
      # user ability
      can [:read, :create], Post
      can [:update, :destroy], Post, :user_id => user.id
      can [:update, :destroy], User, :id => user.id
    end
  end
  
end