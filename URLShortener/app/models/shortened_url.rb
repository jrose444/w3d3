class ShortenedUrl < ApplicationRecord
  
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  def self.create!(user, long_url)
    shortened = SecureRandom::urlsafe_base64
    if ShortenedUrl.exists?(short_url: shortened)
      shortened = SecureRandom::urlsafe_base64
    #hideous kludge
    end
    new = self.new(long_url: long_url, user_id: user.id, short_url: shortened)
    new.save
  end

end