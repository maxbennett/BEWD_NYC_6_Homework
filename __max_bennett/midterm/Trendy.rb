require 'json'
require 'rest-client'
require 'pry'


class Round
	attr_accessor :amount, :year
	def initialize(round={})
	   @amount = round[:amount]
	   @year = round[:year]
	end
end

class Trendy
	attr_accessor :round
	def initialize
		 @roundArray=[]
		 @company_input
	end

	def get_company_input
			puts "What Company Do You Want To Check?"
			@company_input = gets.chomp
	end

	def get_from_crunchbase
		company = RestClient.get("api.crunchbase.com/v/1/company/"+@company_input.to_s+".js?api_key=r3yh3gw8q8gtfb6e7wjarmcz")
		parsed_company = JSON.parse(company)
		n = parsed_company["funding_rounds"].length
		i=0
		until i==n
			_a = parsed_company["funding_rounds"][i]["raised_amount"]
			_y = parsed_company["funding_rounds"][i]["funded_year"]
			@roundArray.push(Round.new({amount: _a, year: _y})) 
			i += 1
		end
	rescue
		puts "no such company"
	end

	def display_rounds
		puts ""
		puts "Fundings Rounds (in k's)"
		puts"================================"
		i=0
		until i == @roundArray.length
			puts "#{@roundArray[i].year} ----------- #{@roundArray[i].amount/1000}"
			i+=1
		end
	end

end

trendy = Trendy.new

trendy.get_company_input

trendy.get_from_crunchbase

puts trendy.display_rounds