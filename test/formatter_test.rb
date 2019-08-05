require_relative './test_helper'
require_relative '../lib/formatter'

class FormatterTest < MiniTest::Test
  def test_prints_result
    results = [['/home', 2]]

    string = Formatter.new(results, 'visits').to_s

    assert_equal '/home                002 visits', string
  end

  def test_prints_results
    results = [['/home', 2], ['/about', 1]]

    string = Formatter.new(results, 'uniques').to_s

    assert_equal "/home                002 uniques\n/about               001 uniques", string
  end
end
