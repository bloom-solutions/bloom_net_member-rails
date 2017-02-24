# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += [
  "bootstrap/css/bootstrap.min.css",
  "bootstrap/js/bootstrap.min.js",
  "font-awesome/css/font-awesome.min.css",
  "jquery/jquery.min.js",
  "metisMenu/metisMenu.min.css",
  "metisMenu/metisMenu.min.js",
  "morris-data.js",
  "morrisjs/morris.css",
  "morrisjs/morris.min.js",
  "sb-admin-2.min.css",
  "sb-admin-2.min.js",
  /\.(?:svg|eot|woff|ttf)$/,
]
