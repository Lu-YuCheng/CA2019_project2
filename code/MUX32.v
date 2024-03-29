// MUX two values of length 32 bits
module MUX32(
    data1_i,
    data2_i,
    select_i,
    data_o
);

// Ports
input   [31:0]  data1_i;
input   [31:0]  data2_i;
input           select_i;
output  [31:0]  data_o;

// Wires and Registers

// Assignment
assign data_o = (select_i == 0)?    data1_i:
                (select_i == 1)?    data2_i:0;

endmodule
