# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
js_prefix    = 'app/assets/javascripts/'
style_prefix = 'app/assets/stylesheets/'
image_prefix    = 'app/assets/images/'

javascripts = Dir["#{js_prefix}**/*.js"].map      { |x| x.gsub(js_prefix,    '') }
css         = Dir["#{style_prefix}**/*.css"].map  { |x| x.gsub(style_prefix, '') }
image       = Dir["#{image_prefix}**/*"].map  { |x| x.gsub(image_prefix, '') }
scss        = Dir["#{style_prefix}**/*.scss"].map { |x| x.gsub(style_prefix, '') }

Rails.application.config.assets.precompile = (javascripts + css + scss + image)
Rails.application.config.assets.precompile << Proc.new { |path|
  if path =~ /\.(eot|svg|ttf|woff)\z/
    true
  end
}
