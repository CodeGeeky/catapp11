class User < ActiveRecord::Base
  has_one :cart
  attr_accessor :password
  before_save :encrypt_password
  has_attached_file :photo, :styles => {:small => "150x150>"},
                    :url => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  
  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

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
  
  # validates role. permits only admin and user.
  validates :role, inclusion: { in: %w(admin user),:allow_blank => true, message: "%{value} is not a valid role for user. Choose between admin and user" }
  
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
