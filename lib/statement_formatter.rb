def format_statement(transactions)
  statement = 'date || credit || debit || balance'
  transactions.reverse!
  transactions.each do |t|
    statement += "\n" + format_transaction(t)
  end
  statement
end

def format_transaction(transaction)
  amount = format_to_two_decimals(transaction.amount)
  balance = format_to_two_decimals(transaction.balance)

  deposit = credit_or_debit(amount, transaction, :deposit)
  withdrawal = credit_or_debit(amount, transaction, :withdraw)

  "#{transaction.date} || #{deposit} || #{withdrawal} || #{balance}"
end

def format_to_two_decimals(amount)
  format('%.2f', amount.to_f)
end

def credit_or_debit(amount, transaction, column)
  amount if transaction.type == column
end
