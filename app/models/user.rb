class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable


	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.username = auth.info.nickname
	  end
	end

	def self.new_with_session(params, session)
	  if session["devise.user_attributes"]
	    new(session["devise.user_attributes"], without_protection: true) do |user|
	      user.attributes = params
	      user.valid?
	    end
	  else
	    super
	  end
	end

	def password_required?
	  super && provider.blank?
	end

	def update_with_password(params, *options)
	  if encrypted_password.blank?
	    update_attributes(params, *options)
	  else
	    super
	  end
	end

# # app/models/user.rb
 
# devise :omniauthable
 
# ## Omniauthable
# field :provider
# field :uid
 
# embeds_one :user_linkedin_connection, :class_name => 'User::LinkedinConnection'
 
# def connect_to_linkedin(auth)
#   self.provider = auth.provider
#   self.uid = auth.uid
#   self.user_linkedin_connection = User::LinkedinConnection.new(:token => auth["extra"]["access_token"].token, :secret => auth["extra"]["access_token"].secret)
#   unless self.save
#     return false
#   end
#   true
# end
 
# def disconnect_from_linkedin!
#   self.provider = nil
#   self.uid = nil
#   self.user_linkedin_connection = nil
#   self.save!
# end



end
