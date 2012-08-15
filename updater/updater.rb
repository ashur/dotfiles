#!/usr/bin/ruby

require 'Date'
require 'fileutils'

timeFile = ENV['HOME'] + "/.dotfiles/updater/last_update.txt"

modDate = File.mtime(timeFile)
#puts "dotFiles last updated on #{modDate}"

now = Time.new()

checkDate = modDate + 60 * 60 * 24
#checkDate = modDate + 1

if (checkDate <= now)
	puts "Checking for changes to .dotfiles"
	Dir.chdir ENV['HOME'] + "/.dotfiles/"
	puts `git pull`
	FileUtils.touch timeFile
end