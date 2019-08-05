require_relative './test_helper'
require_relative '../lib/unique_views'
require_relative '../lib/request'

class UniqueViewsTest < MiniTest::Test
  def test_count_views_per_path_and_ip
    path = '/home'

    logs = [
      Request.new(path: path, ip: '127.0.0.1'),
      Request.new(path: path, ip: '127.0.0.2'),
      Request.new(path: path, ip: '127.0.0.1'),
    ]
    result = RequestView::UniqueViews.new(logs)

    assert_equal [['/home', 2]], result.list
  end

  def test_sort_by_unique_count
    home_path = '/home'
    about_path = '/about'
    contact_path = '/contact'

    logs = [
      Request.new(path: about_path, ip: '127.0.0.1'),
      Request.new(path: home_path, ip: '127.0.0.1'),
      Request.new(path: home_path, ip: '127.0.0.1'),
      Request.new(path: about_path, ip: '127.0.0.2'),
      Request.new(path: contact_path, ip: '127.0.0.2'),
      Request.new(path: home_path, ip: '127.0.0.2'),
      Request.new(path: about_path, ip: '127.0.0.3'),
    ]
    result = RequestView::UniqueViews.new(logs)

    assert_equal [['/about', 3], ['/home', 2], ['/contact', 1]], result.list
  end
end
