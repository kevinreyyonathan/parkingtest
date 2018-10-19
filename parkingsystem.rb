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

	
	def slot_no_by_color(color)
		result = parking_lot.get_slot_no_by_color(color)
		size = result.size
		compact_to_string(size, result)
	end


	def slot_no_by_registration_no(reg_no)
		slot_no = parking_lot.get_slot_no_by_registration_no(reg_no)
		return 'Not found' unless slot_no
		slot_no.to_s
	end
	
	def print_table
		parking_slots = parking_lot.slots
		puts "Slot No. \t Registration No. \t Color"
		parking_slots.each_with_index do |slot, idx|
			next unless slot
			output = (idx+1).to_s + "\t\t" + slot.reg_no + "\t\t" + slot.color
			puts output
		end
	end

	def park_on_slot(reg_no:, color:, slot_no:)
		car = Car.new(reg_no: reg_no, color: color)
		parking_lot.park(car: car, slot_no: slot_no)
	end

	
	def park_check(reg_no:, color:, slot_no:)
		if slot_no
			park_on_slot(reg_no: reg_no, color: color, slot_no: slot_no)
			print_result 'Allocated slot number: ' + (slot_no + 1).to_s
		else
			print_result 'Sorry, the parking lot is currently full'
		end
	end
	
	
	def leave_process(num_in_str)
		num_in_int = str_to_int(num_in_str)
		leave_park_slot(num_in_int - 1)
		print_result('Slot number ' + num_in_str + ' is free')
	end
	
