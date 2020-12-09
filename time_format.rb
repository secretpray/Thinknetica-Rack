class TimeFormat
  ALLOWED_KEYS = %w[year month day hour minute second]
  FORMAT_MAPPING = {
    'year'   => '%Y',
    'month'  => '%m',
    'day'    => '%d',
    'hour'   => '%H',
    'minute' => '%M',
    'second' => '%S'
  }

  def self.call(keys)
    new(keys).call
  end

  def initialize(keys)
    @keys = keys
  end

  def call
    @keys_unknown = @keys.difference(ALLOWED_KEYS) # @keys - ALLOWED_KEYS
    self
  end

  def valid?
    @keys_unknown.empty?
  end

  def success
    format_string = @keys.map(&FORMAT_MAPPING).join('-')
    "#{DateTime.now.strftime(format_string)}\n"
  end

  def unknown_format
    "Unknown time format [#{@keys_unknown.join(', ')}]\n"
  end
end
