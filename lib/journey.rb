class Journey

  PENALTY_FARE = 6.6
  NORM_FARE = 3

  def fare(card, entry_station=nil)
    # norm_fare = 3
    fee = entry_station ? NORM_FARE : PENALTY_FARE
    deduct(card, fee)
  end

  private

  def deduct(card, fee)
    card.balance -= fee
  end
end
