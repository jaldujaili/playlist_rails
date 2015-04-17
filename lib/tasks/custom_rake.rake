# require 'factory_girl'

namespace :create do 
  desc "create album data"
  task :album=> :environment do
    require File.expand_path("spec/factories/albums.rb")
    @album= FactoryGirl.create :albums
    puts "#{@album.title}"
  end
end