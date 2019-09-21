#!/usr/bin/env ruby

require_relative 'parser'

parser = RGitParser.new
parser.parse(ARGV)