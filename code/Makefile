# With Pipeline registers but without handling hazard
CPU.out : Adder.v ALU.v ALU_Control.v Control.v \
			CPU.v Data_Memory.v Shift.v Instruction_Memory.v MUX32.v \
			PC.v Registers.v Imm_Gen.v testbench.v EX_MEM.v \
			ID_EX.v IF_ID.v MEM_WB.v Forwarding.v HazardDetection.v MUX7.v \
			MUX32_forwarding.v Equal.v dcache_data_sram.v dcache_tag_sram.v \
			dcache_top.v
		iverilog -o CPU.out CPU.v testbench.v ALU_Control.v \
			Control.v Data_Memory.v Shift.v Instruction_Memory.v MUX32.v PC.v \
			Registers.v Imm_Gen.v Adder.v ALU.v IF_ID.v ID_EX.v \
			EX_MEM.v MEM_WB.v Forwarding.v HazardDetection.v MUX7.v \
			MUX32_forwarding.v Equal.v dcache_data_sram.v dcache_tag_sram.v \
			dcache_top.v
# With Forwarding unit
# With Hazard detection unit
clean :
	rm CPU.out
