class ParkingSystem
	attr_accessor :parking_lot
	attr_reader :input , :input_path

	def recv_user_input
		@input = STDIN.gets.strip
	end
	
	def leave_parking_slot(slot_no)
		parking_lot.leave slot_no
	end
	
	def print_result(output)
		puts output
	end

	def to_num_or_nil(string)
		Integer(string || '')
	rescue ArgumentError
		nil
	end
