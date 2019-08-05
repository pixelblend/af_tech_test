class Formatter
  def initialize(results, label)
    @results = results
    @label = label
  end

  attr_reader :results, :label

  def to_s
    results.map do |url, hits|
      url = url.ljust(20)
      hits = String(hits).rjust(3, '0')

      "#{url} #{hits} #{label}"
    end.join("\n")
  end
end
