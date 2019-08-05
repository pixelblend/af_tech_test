require_relative './request'

class Parser
  def initialize(logs)
    @logs = logs
  end

  def requests
    @requests ||= parse_logs
  end

  attr_reader :logs

  private

  def parse_logs
    logs.map do |log|
      path, ip = log.split
      Request.new(path: path, ip: ip)
    end
  end
end
