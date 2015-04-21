class User < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie
  has_many :critiques, through: :reviews, source: :movie
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
            format: /\A\S+@\S+\z/,
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true }

  scope :by_name, -> { order(:name) }
  # scope :not_admins, -> { by_name.where(admin: false) }
  scope :past_n_days, ->(days) { where('created_at >= ?' , days.days.ago) }
  scope :grossed_less_than, ->(amount) { released.where('total_gross < ?', amount) }
  scope :grossed_greater_than, ->(amount) { released.where('total_gross > ?', amount) }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
                      
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
end
