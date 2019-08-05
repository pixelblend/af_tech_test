class Request
  def initialize(path: '', ip: '')
    @path = path
    @ip = ip
  end

  attr_reader :path, :ip
end
