class MatchesController < ApplicationController
before_action :require_signin! 
require 'httparty'
require 'json'
	def show 


end



	def index


		matches_list_for_current_user = @current_user.uid
		@apiurl='https://api.opendota.com/api/players/' + matches_list_for_current_user+'/recentMatches?limit=10?win'
		
	    @matches = HTTParty.get(@apiurl,
	    :headers =>{'Content-Type' => 'application/json'} )
		string = @matches.to_s

		@parsed =JSON.parse(string)	
		@radiant_win = @parsed[0]['radiant_win']
		playerSlot=@parsed[0]['player_slot']
		 

		# hero info

		heroapiurl= URI.parse(URI.encode('https://api.opendota.com/api/heroStats'))
		@heroes=HTTParty.get(heroapiurl, :headers =>{'Content-Type'=>'application/json'} )
		hero_string=@heroes.to_s
		@herosparsed = JSON.parse(hero_string)

		
	end

	def leaderboard	  

		user= User.find_by(params[:id])
	

  		@users = User.paginate(page: params[:page])
  		
		matches_for_current_user = @current_user.uid


		@apiurl='https://api.opendota.com/api/players/' + matches_for_current_user
		
	    @matches = HTTParty.get(@apiurl,
	    :headers =>{'Content-Type' => 'application/json'} )
		string = @matches.to_s

		@parsed=JSON.parse(string)

		@parsed.each_pair do |key, value|
			if key =="solo_competitive_rank" 
				user.solo=value
				user.save!
			end
		end


		@parsed.each_pair do |key, value|
			if key =="competitive_rank" 
				user.party=value
				user.save!
			end
		end

		puts 'hello from the leaderboard method of the matches controller'
 	end	

end

