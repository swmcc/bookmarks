class User < ApplicationRecord
  
  # TODO: https://github.com/swmcc/bookmarks/issues/9 
  # enum :role, %i[user admin], suffix: true, default: :user 

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def admin_role?
     true
  end

  def user_role?
     true
  end
end
