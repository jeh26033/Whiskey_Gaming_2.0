class MatchesController < ApplicationController
before_action :require_signin! 
require 'httparty'

	def index

		matches_for_current_user = @current_user.uid
		@apiurl='https://api.opendota.com/api/players/' + matches_for_current_user
		
	    @matches = HTTParty.get(@apiurl,
	    :headers =>{'Content-Type' => 'application/json'} )
		string = @matches.to_s

		@parsed=JSON.parse(string)

		@parsed.each_pair do |key, value|
			if key =="solo_competitive_rank" 
				@solo_rank=value
			end
		end

		@parsed.each_pair do |key, value|
			if key =="solo_competitive_rank" 
				@solo_rank=value
			end
		end

		@parsed.each_pair do |key, value|
			if key =="competitive_rank" 
				@party_rank=value
			end
		end

		@parsed.each_pair do |key, value|
			if key =="solo_competitive_rank" 
				@solo_rank=value
			end
		end

	end
end

