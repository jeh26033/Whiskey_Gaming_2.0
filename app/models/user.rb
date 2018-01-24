class User < ApplicationRecord
	require 'httparty'
	require 'json'
	
	class << self
		def from_omniauth(auth)
			attr_accessor :solo, :party, :fantasy
			info = auth['info']
			# Convert from 64-bit to 32-bit
			user = find_or_initialize_by(uid: (auth['uid'].to_i - 76561197960265728).to_s)
			user.nickname = info['nickname']
			user.avatar_url = info['image']
			user.profile_url = info['urls']['Profile']
			user.save!
			user
		end


	def grab_mmr(user)
		matches_for_current_user = user.uid
		uri='https://api.opendota.com/api/players/' + matches_for_current_user
		response= HTTParty.get(uri)
		user_data = JSON.parse(response)
	  	puts user_data  
	  end
	 
	end
	


end
