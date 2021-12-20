class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, through: :roles, source: :resource, source_type:  :Post
  # has_many :creator_posts, -> { where(roles: {name: :creator}) } through: :roles, source: :resource, source_type:  :Post
  # has_many :editor_posts, -> { where(roles: {name: :editor}) } through: :roles, source: :resource, source_type:  :Post


  has_many :invitees, class_name: "User", foreign_key: :invited_by_id
  # has_many :posts
  # has_many :user_posts
  # has_many :posts ,through: :user_posts 

  after_create :assign_default_role

  validate :must_have_a_role, on: :update

  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end

  private

  def must_have_a_role
    errors.add(:roles, "please assign a role")
  end
end
