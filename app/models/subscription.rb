class Subscription
  attr_reader :period, :valid_periods

  def initialize(period:, valid_periods:)
    @valid_periods = valid_periods
    @period = period
  end

  def change_periodicity(period:)
    if @valid_periods.include?(period)
      @period = period
    else
      raise "This subscriptions only have these valid periods: #{valid_periods}"
    end
  end
end
