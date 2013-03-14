require 'digest'

class User < ActiveRecord::Base
  # Remember to create a migration!
  before_create :hash_password
  before_create :create_secret_page
  
  private
  
  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end

  def self.authenticate(args)
    pw = Digest::MD5.hexdigest(args[:password])
    user = User.where('password = ? AND email = ?', pw, args[:email])
    user.first
  end

  def create_secret_page
    self.secret_page = self.name.gsub(/\s+/, "").downcase 
  end
end
