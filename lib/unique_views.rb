require 'set'

module RequestView
  class UniqueViews
    def initialize(logs)
      @logs = logs
    end

    def list
      @list ||= render_list
    end

    attr_reader :logs

    private

    def render_list
      build_list
      reduce_list
      order_list
    end

    def build_list
      @list = logs.each_with_object({}) do |log, acc|
        ips = acc.fetch(log.path, Set.new)
        ips << log.ip

        acc.store(log.path, ips)
      end
    end

    def reduce_list
      @list = @list.map do |path, hits|
        [path, hits.count]
      end
    end

    def order_list
      @list.to_a.sort_by { |path, hits| hits }.reverse
    end
  end
end
