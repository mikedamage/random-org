require 'uri'
require 'net/http'

module RandomOrg
	
	class Integer
		@@url = URI.parse("http://random.org/integers/")
		ValidBases = [2, 8, 10, 16]
		
		attr_reader :min, :max, :base, :value, :opts
		
		def initialize(min, max, base=10)
			@min = min.to_s
			@max = max.to_s
			@base = base.to_s
			@@url.query = "num=1&min=#{@min}&max=#{@max}&col=1&base=#{@base}&format=plain&rnd=new"
			begin
				@value = Net::HTTP.get(@@url).chomp.to_i
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
		
	end
end