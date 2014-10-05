class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :news_items
  alias_attribute :to_s, :email

  ROLES = %w[admin seo user]

  def admin?
    self.role == 'admin'
  end
end
