module ShareLinksHelper
  def generate_short_string
    SecureRandom.urlsafe_base64.first(4)
  end
end
