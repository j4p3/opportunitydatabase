require "#{Dir.pwd}/settings" if Rails.env.development?

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env.development?
		provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET
	else
		provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
	end
end