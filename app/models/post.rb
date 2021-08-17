class Post < ActiveRecord::Base
  belongs_to :user
	has_many :comments,dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	validates :body,  presence: true
  before_save :capitalize_title
  scope :order_date_desc, ->{order(created_at :desc)}
  private
  def capitalize_title
    self.title=self.title.upcase
  end
end
