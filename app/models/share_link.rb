class ShareLink < ActiveRecord::Base
  before_save { self.original_url = original_url.downcase }

  validates :original_url, presence: true,
                          uniqueness: true
  validates :shorten_url, presence: true,
                          length: { minimum: 4 },
                          uniqueness: true
end
