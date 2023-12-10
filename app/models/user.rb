class User < ApplicationRecord
  validates :username, presence :true, length: {minimum:3, maximum:25}
  validates :email, presence :true, uniqueness: { case_sensitive: false }
end
