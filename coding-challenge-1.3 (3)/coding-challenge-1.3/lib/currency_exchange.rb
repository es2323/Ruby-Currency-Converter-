require "json"

module CurrencyExchange
  DATA_FILE_PATH = File.join(__dir__, "C:\Users\enosh\Desktop\CODE\RUBY\coding-challenge-1.3 (3)\coding-challenge-1.3\data\eurofxref-hist-90d.json")

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    data = load_data
    rates = data[date]

    raise "No rates found for date: #{date}" unless rates
    raise "Invalid currency: #{from_currency}" unless rates[from_currency]
    raise "Invalid currency: #{to_currency}" unless rates[to_currency]
  
    from_rate = rates[from_currency]
    to_rate = rates[to_currency]

    (to_rate / from_rate).round(6)
end
