require_relative './test_helper'
require_relative '../lib/parser'

class ParserTest < MiniTest::Test
  def test_splits_path_and_ip
    logs = ['/home 127.0.0.1']

    parser = Parser.new(logs)

    request = parser.requests.first

    assert_equal '/home', request.path
    assert_equal '127.0.0.1', request.ip
  end
end
