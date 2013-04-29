#!/usr/bin/ruby

require 'fileutils'

timeFile = ENV['HOME'] + "/.dotfiles/updater/last_update.txt"
modDate = Time.now - + 60 * 60 * 25

if File.exists?(timeFile)
  modDate = File.mtime(timeFile)
  #puts "dotFiles last updated on #{modDate}"
end

now = Time.new()

checkDate = modDate + 60 * 60 * 24
#checkDate = modDate + 1

if (checkDate <= now)
	puts "Checking for changes to .dotfiles"
	Dir.chdir ENV['HOME'] + "/.dotfiles/"
	puts `git pull`
	puts `git submodule init`
	puts `git submodule update`
	
  puts `antigen update`
  
	FileUtils.touch timeFile
  
  puts "Don't forget to run reload!"
end