# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'
require 'bubble-wrap/location'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'yelpish'
  app.files << Dir.glob("./config/*.rb")
  app.resources_dirs << ['resources/photos_small']
end
task :"build:simulator" => :"schema:build"
