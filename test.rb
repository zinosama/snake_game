require 'timeout'
class Test
	attr_accessor :input 
	def initialize
		@input = "haha"
	end

	def testla
		Timeout::timeout(1){
			puts "input: "
			input=gets.chomp
		}
		puts input

	end

	def test2
		ready_fds = select [ $stdin ], [], [], 1
		if ready_fds.nil?
			puts "no input"
		end
		# puts ready_fds.first.first.gets unless ready_fds.nil?
	end
end

test=Test.new 
test.test2