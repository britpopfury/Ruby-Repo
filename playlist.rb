#!/bin/env ruby
# encoding: utf-8
require 'pry'
# using the shuffle method as defined above
my_music = Dir['/Users/lorraine/Desktop/SourceMusic/**/*.m4a']
my_music.shuffle

File.open 'playlist.m3u', 'w' do |f|
	my_music.each do |m4a|
		f.write m4a+"\n"
	end
end
puts 'Done!'
