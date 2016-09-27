class User < ActiveRecord::Base
    def create!(params)             # params is required to have :user_id and :email 
        params[:session_token] = SecureRandom.base64 # Add random session token to params hash
        ActiveRecord::create!(params)
    end
end
