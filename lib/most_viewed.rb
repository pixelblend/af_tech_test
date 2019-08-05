module RequestView
  class MostViewed
    def initialize(logs)
      @logs = logs
    end

    def list
      @list ||= order_list(build_list)
    end

    attr_reader :logs

    private

    def build_list
      logs.each_with_object({}) do |log, acc|
        count = acc.fetch(log.path, 0)
        acc.store(log.path, count + 1)
      end
    end

    def order_list(list)
      list.to_a.sort_by { |path, hits| hits }.reverse
    end
  end
end
