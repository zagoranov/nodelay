class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


helper_method :current_user

private

def pontificate(mess)  	#Send message to my Telegram bot
  require 'nokogiri'
  require 'open-uri'
  require 'net/https'
  @doc = Nokogiri::HTML(open("https://api.telegram.org/BOTNAME:UID/sendMessage?chat_id=CHAT_ID&text=" + mess,  :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
end


public

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end



end
