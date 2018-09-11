class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates(:content, presence: true)
  validates(:user_id, presence: true)
end
