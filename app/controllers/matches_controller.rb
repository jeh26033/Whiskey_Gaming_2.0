class MatchesController < ApplicationController
before_action :require_signin! 
require 'httparty'
require 'json'

	def show 
	end



	def index #generates the data for a users matches


		matches_list_for_current_user = @current_user.uid
		@apiurl='https://api.opendota.com/api/players/' + matches_list_for_current_user+'/recentMatches?limit=10?win'
		
	    @matches = HTTParty.get(@apiurl,
	    :headers =>{'Content-Type' => 'application/json'} )
		string = @matches.to_s

		@parsed =JSON.parse(string)	
		@radiant_win = @parsed[0]['radiant_win']
		playerSlot=@parsed[0]['player_slot']

		herouri = 'https://api.opendota.com/api/heroStats'
 		heroes = HTTParty.get(herouri, :headers =>{'Content-Type'=>'application/json'} )
		hero_string=heroes.to_s
		@heroes_parsed = JSON.parse(hero_string)

		@hero_list = Array.new(@heroes_parsed) { |x| puts x } 
		@hero_list_length = []
		i=-1 
		while @hero_list_length.length < @heroes_parsed.length 
			i+=1
			@hero_list_length.push(i)
		end

		@hero_list_length.each do |i|
			@hero_name = @hero_list[i]['localized_name']
			@hero_img = @hero_list[i]['icon']+'http://cdn.dota2.com/'
			$hero_id= @hero_list[i]['id']

		end
	end

	def leaderboard	  #grabs mmr

		user= User.find_by(params[:id])
	

  		@users = User.paginate(page: params[:page])
  		
		matches_for_current_user = @current_user.uid

		@apiurl='https://api.opendota.com/api/players/' + matches_for_current_user
	
	    @matches = HTTParty.get(@apiurl,
	    :headers =>{'Content-Type' => 'application/json'} )
		string = @matches.to_s

		@parsed=JSON.parse(string)

		#assigning mmr to DB 
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


 	def meta 
 		#tests the method for life
 		puts' hello from the meta method'
 		herouri = 'https://api.opendota.com/api/heroStats'
 		heroes = HTTParty.get(herouri, :headers =>{'Content-Type'=>'application/json'} )
		hero_string=heroes.to_s
		@heroes_parsed = JSON.parse(hero_string)

		@hero_list = Array.new(@heroes_parsed) { |x| puts x } 


		hero_list_length = []
		i=-1 
		while hero_list_length.length < @heroes_parsed.length 
			i+=1
			hero_list_length.push(i)
		end

		hero_list_length.each do |i| 
			@hero_name = @hero_list[i]['localized_name']
			@hero_img = @hero_list[i]['icon']+'http://cdn.dota2.com/'
			$hero_id= @hero_list[i]['id']
		end
 	end

end

