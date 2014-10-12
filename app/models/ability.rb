class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.admin?
        can :manage, Article
        can :manage, NewsItem
        can :manage, ContentPage
      else
        can :read, NewsItem
        can :read, Article
        can :read, ContentPage
      end
  end
end
