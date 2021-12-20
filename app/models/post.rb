class Post < ApplicationRecord
    resourcify
    # has_many :user_posts
    # has_many :users ,through: :user_posts 
    has_many :users, through: :roles, class_name: 'User', source: :users
    # has_many :creators, -> { where(:roles => {name: :creators}) }, through: :roles, class_name: 'User', source: :users
    # has_many :editors, -> { where(:roles => {name: :editors}) }, through: :roles, class_name: 'User', source: :users
end
