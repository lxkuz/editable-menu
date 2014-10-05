class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    cannot :manage, :all

    if user.admin?
      can :manage, NewsItem
    else
      can :read, NewsItem
      can :read, Article
    end
  end
end
