class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :email, :presence => true, 
                    :uniqueness => true,
                    :format => { :with => %r{.+@.+\..+} }        
  
  validates :phone, :presence => true,
                    :uniqueness => true,
                    :length => { is: 10 },
                    numericality: true
                    
  validates :name, :presence =>true, format: { without: /\d/} 
    #with: /^[0-9`!@#\$%\^&*+_=]+$/, message: "only allows letters" }

  def self.authenticate(phone, password)
    user = find_by_phone(phone)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
