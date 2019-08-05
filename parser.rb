#!/usr/bin/env ruby

require_relative './lib/parser'
require_relative './lib/formatter'
require_relative './lib/most_viewed'
require_relative './lib/unique_views'

abort 'USAGE: parser.rb <path to log>' if ARGV.empty?

logs = File.read(ARGV.first).split("\n")
requests = Parser.new(logs).requests

most_viewed = Formatter.new(
  RequestView::MostViewed.new(requests).list,
  'visits'
)

unique_views = Formatter.new(
  RequestView::UniqueViews.new(requests).list,
  'unique views'
)

puts <<~EOF
#{most_viewed}

#{unique_views}
EOF
