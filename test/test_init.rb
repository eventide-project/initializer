ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= 'trace'

puts RUBY_DESCRIPTION

require_relative '../init.rb'
Initializer.activate

require 'test_bench'; TestBench.activate

require 'initializer/controls'

