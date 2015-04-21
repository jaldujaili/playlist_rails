require 'factory_girl'

namespace :create do 
  desc "create album data"
  task :album=> :environment do
    require File.expand_path("spec/factories/albums.rb")
    @album= FactoryGirl.create :album
    puts "#{@album.title}"
  end

  desc "create artist data"
  task :artist=> :environment do
    require File.expand_path("spec/factories/artists.rb")
    @artist= FactoryGirl.create :artist
    puts "#{@artist.name}"
  end

  desc "create playlist data"
  task :playlist=> :environment do
    require File.expand_path("spec/factories/playlists.rb")
    @playlist= FactoryGirl.create :playlist
    puts "#{@playlist.title}"
  end

  desc "create song data"
  task :song=> :environment do
    require File.expand_path("spec/factories/songs.rb")
    @song= FactoryGirl.create :song
    puts "#{@song.title}"
    puts "#{@song.genre}"
  end

  desc "create user data"
  task :user=> :environment do
    require File.expand_path("spec/factories/users.rb")
    @user= FactoryGirl.create :user
    puts "#{@user.name}"
  end

  desc "create random batch"
  task :random_batch=> :environment do |t, args|
    require File.expand_path("spec/factories/songs.rb")
    args.with_defaults(:num_songs=>50)
    num_songs=args.num_songs

    if User.all.size == 0
      1.times do
        Rake::Task['create:user'].reenable
        Rake::Task['create:user'].invoke

      end
    end


    if Playlist.all.size <30
      10.times do
        Rake::Task['create:playlist'].reenable
        Rake::Task['create:playlist'].invoke
      end
    else
      puts "you have a lot of playlists"
    end

    if Artist.all.size <30
      10.times do
        Rake::Task['create:artist'].reenable
        Rake::Task['create:artist'].invoke
      end
    else
      puts "There's a lot of Artists"
    end

    if Album.all.size <30
      10.times do
        Rake::Task['create:album'].reenable
        Rake::Task['create:album'].invoke
      end
      puts "There's a lot of albums"
    end
    #creating songs
    num_songs.times do
      Rake::Task['create:song'].reenable
      Rake::Task['create:song'].invoke
    end
    end


  desc "create all data"
  task :all=> [:playlist, :artist, :song, :album, :user]
end