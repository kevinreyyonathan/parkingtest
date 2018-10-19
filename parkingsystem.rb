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

	def str_to_int(num_in_str)
		num_in_int = to_num_or_nil(num_in_str)
		exit_execution unless num_in_int
		num_in_int
	end
	
	def compact_to_string(size_in_str)
		result_string = ''
		
		array.each_with_index do |result, idx|
			result_string += result
		
			result += ', ' if idx != size - 1
		end

		result_string
	end


	def create_parking_lot(size_in_str)
		size_in_int = str_to_int(size_in_str)
		@parking_lot = ParkingLot.new(size_in_int)
	end


	def registration_no_by_color(color)
		results = parking_lot.get_reg_no_by_color(color)
		
		size = result.size

		compact_to_string(size, results)
	end

	
