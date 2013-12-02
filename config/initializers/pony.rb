Pony.options = {
    :to => 'sshakya.mail@gmail.com',
    :via => :smtp,
    :via_options => {
      :address => 'smtp.gmail.com',
      :port => '587',
      :enable_starttls_auto => true,
      :user_name => 'sshakya.mail@gmail.com',
      :password => '__Error$404',
      :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
}