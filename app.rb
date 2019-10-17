require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/application'
require 'app/board'
require 'app/board_case'
require 'app/game'
require 'app/player'
require 'views/show'

system "clear"
Application.start
