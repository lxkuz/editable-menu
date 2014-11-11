class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.admin?
        can :manage, Article
        can :manage, NewsItem
        can :manage, ContentPage
        can :manage, PromoSlide
        can :manage, FrontPageBanner
      else
        can :read, NewsItem
        can :read, Article
        can :read, ContentPage
        can :read, PromoSlide
        can :read, FrontPageBanner
      end
  end
end
