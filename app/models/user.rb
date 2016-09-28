class User < ActiveRecord::Base
    
    def self.create_user!(params)             # params is required to have :user_id and :email 
        params[:session_token] = SecureRandom.base64 # Add random session token to params hash
        User.create!(params)
    end
end
