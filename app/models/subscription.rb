class Subscription
  attr_reader :id, :period, :valid_periods

  def initialize(id:, period:, valid_periods:)
    @valid_periods = valid_periods
    @period = period
    @id = id
  end

  def change_periodicity(period:)
    if @valid_periods.include?(period)
      @period = period
    else
      raise "This subscriptions only have these valid periods: #{valid_periods}"
    end
  end
end
