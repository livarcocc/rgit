#!/usr/bin/env ruby

require_relative 'parser'
require_relative 'commands/init_command'

subcommands = {
  'init' => InitCommand.new
}

parser = RGitParser.new(subcommands)
command = parser.parse(ARGV)
command.execute unless command.nil?