# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Tmdb::Api.key("7683128b696aa92114133c4e98907b2f")
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
