require_relative './test_helper'
require_relative '../lib/most_viewed'
require_relative '../lib/request'

class MostViewedTest < MiniTest::Test
  def test_count_views_per_path
    path = '/home'

    logs = [
      Request.new(path: path),
      Request.new(path: path),
    ]
    result = RequestView::MostViewed.new(logs)

    assert_equal result.list, [['/home', 2]]
  end

  def test_order_paths_by_count
    home_path = '/home'
    about_path = '/about'
    contact_path = '/contact'

    logs = [
      Request.new(path: about_path),
      Request.new(path: about_path),
      Request.new(path: contact_path),
      Request.new(path: contact_path),
      Request.new(path: contact_path),
      Request.new(path: home_path),
    ]

    result = RequestView::MostViewed.new(logs)

    assert_equal [['/contact', 3], ['/about', 2], ['/home', 1]], result.list
  end
end
