# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
run Rails.application
