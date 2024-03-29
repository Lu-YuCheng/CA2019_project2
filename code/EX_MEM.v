// EX/MEM pipeline registers
module EX_MEM(
    clk_i,
    rst_i,
    start_i,
    mem_stall_i,
    ALUResult_i,
    RS2data_i,
    MemRead_i,
    MemtoReg_i,
    MemWrite_i,
    RegWrite_i,
    RDaddr_i,

    ALUResult_o,
    RS2data_o,
    MemRead_o,
    MemtoReg_o,
    MemWrite_o,
    RegWrite_o,
    RDaddr_o
);

// Ports
input                   clk_i;
input                   rst_i;
input                   start_i;
input                   mem_stall_i;
input       [31:0]      ALUResult_i;
input       [31:0]      RS2data_i;
input                   MemRead_i;
input                   MemtoReg_i;
input                   MemWrite_i;
input                   RegWrite_i;
input       [4:0]       RDaddr_i;

output  reg [31:0]      ALUResult_o;
output  reg [31:0]      RS2data_o;
output  reg             MemRead_o;
output  reg             MemtoReg_o;
output  reg             MemWrite_o;
output  reg             RegWrite_o;
output  reg [4:0]       RDaddr_o;

// Assignment
always@(posedge clk_i or negedge rst_i) begin
    if(mem_stall_i) begin
    end
    else if(start_i && rst_i) begin
        ALUResult_o     <=   ALUResult_i;
        RS2data_o       <=   RS2data_i;
        MemRead_o       <=   MemRead_i;
        MemtoReg_o      <=   MemtoReg_i;
        MemWrite_o      <=   MemWrite_i;
        RegWrite_o      <=   RegWrite_i;
        RDaddr_o        <=   RDaddr_i;
    end
    else begin
        ALUResult_o     <=   32'b0;
        RS2data_o       <=   32'b0;
        MemRead_o       <=   1'b0;
        MemtoReg_o      <=   1'b0;
        MemWrite_o      <=   1'b0;
        RegWrite_o      <=   1'b0;
        RDaddr_o        <=   5'b0;
    end
end

endmodule
