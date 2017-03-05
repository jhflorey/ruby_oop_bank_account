class BankAccount
	attr_accessor :account_number, :checking_balance, :saving_balance
	@account_counter = 0

	class << self
		attr_accessor :account_counter
	end

	def initialize
		createAccountNumber
		@saving_balance = 2500
		@checking_balance = 5000
		@interest_rate = 0.05
		self.class.account_counter += 1
	end

	def displayAccountNumber
		puts @account_number
	end

	def saveAccountBalance
		puts "Your saving account balance is: #{@saving_balance}"
	end

	def checkAccountBalance
		puts "Your checking account balance is: #{@checking_balance}"
	end

	def deposit(amount, account)
		if account == "saving"
			puts "deposite savings"
			@saving_balance += amount
		else
			puts "deposite checking"
			@checking_balance += amount
		end
	end

	def withdraw(amount, account)
		if account == "saving"
			if amount < @saving_balance
				@saving_balance -= amount
			else
				puts "Your saving account is not have enough money"
			end
		else
			if amount < @checking_balance
				@checking_balance -= amount
			else
				puts "Your checking account is not have enough money"
			end
		end
	end
	def displayTotalBalance
		puts "Your checking account balance is: #{@checking_balance}"
		puts "Your saving account balance is: #{@saving_balance + (@saving_balance * interest_rate)}"
		puts "Your total balance is: #{@checking_balance + (@saving_balance + (@saving_balance * @interest_rate))}"
	end

	def account_information
		puts "Your account account number is: #{@account_number}"
		puts "Total balance is: #{@checking_balance + (@saving_balance + (@saving_balance * @interest_rate))}"
		puts "Total checking balance is: #{@checking_balance}"
		puts "Total saving balance is: #{@saving_balance + (@saving_balance * @interest_rate)}"
		puts "The interest rate is: #{@interest_rate}"
	end

	def count_account
		puts "There are a total of #{self.class.account_counter} accounts"
	end

	private
	attr_accessor :interest_rate

	def createAccountNumber
		@account_number = Integer(rand.to_s[2..9])
	end
end


user1 = BankAccount.new
user1.displayAccountNumber
user1.deposit(800, "checking")
user1.deposit(400, "saving")
user1.withdraw(200, "saving")
user1.withdraw(100, "checking")
user1.displayTotalBalance
user1.account_information










