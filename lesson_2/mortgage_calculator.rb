require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.to_f > 0
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['break'])

loop do
  prompt(MESSAGES['loan_amount'])

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)
    prompt(MESSAGES['valid_number'])
  end

  prompt(MESSAGES['apr'])

  annual_interest_rate = ''
  loop do
    annual_interest_rate = gets.chomp

    break if valid_number?(annual_interest_rate)
    prompt(MESSAGES['valid_number'])
  end

  prompt(MESSAGES['loan_duration'])

  years = ''
  loop do
    years = gets.chomp

    break if valid_number?(years)
    prompt(MESSAGES['valid_number'])
  end

  monthly_interest_rate = (annual_interest_rate.to_f / 12) / 100
  months = years.to_i * 12
  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate / (1 -
                    (1 + monthly_interest_rate)**(-months)))

  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")
  prompt(MESSAGES['break'])

  prompt(MESSAGES['continue'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(MESSAGES['thank_you'])
