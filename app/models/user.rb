class User < ActiveRecord::Base
  before_save :format_email

  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie
  has_many :critiques, through: :reviews, source: :movie
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
            format: /\A\S+@\S+\z/,
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8, allow_blank: true }

  scope :by_name, -> { order(:name) }
  scope :not_admins, -> { by_name.where(admin: false) }

  
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
                      
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def format_email
    self.email = email.downcase
  end
end
