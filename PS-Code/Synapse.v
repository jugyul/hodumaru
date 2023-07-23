// module synapse( clk, rst, kill,
//                 weight,
//                 neuron_number,
//                 W_EN, R_EN
//                 weight_out
//                         );


//  // synapse Inputs Declaration

// input [7:0] weight; //TODO:
// input clk, rst, kill, W_EN, R_EN;
// input [7:0] neuron_number;

// output weight_out //INOUT?

// reg _neuron_number;
// reg _weight;
// reg _weight_out;

// Synapse_BRAM weight_table (
//     .clk(clk),
//     .addr(_neuron_number),
//     .data(_weight),
//     .W_EN(W_EN),
//     .q(_weight_out)
// );


// always @(posedge clk or negedge rst) begin 
// 	if (!rst) begin // init : #table 저장
		
// 	end

//     else if (kill == 1'b1) begin //table data 뺴라
//         //for
 
//     end


//     else begin

//         if(W_EN == 1'b1 ) begin //WRITE
//             weight_table[_neuron_number] <= _weight;

//         end

//         else begin //READ
//             _weight_out <= weight_table[_neuron_number]; //TODO:
//         end

//     end



// assign weight_out = _weight_out;

// end

// endmodule


// // Table Module for Neuron Number

// // module NeuronNumberTable();

// // input [7:0] Neuron_number;
// // output [] weight;

// // always @(Neuron_number) begin
// //     case(Neuron_number)
// //         7'b0000000: 0;
// //         7'b0000001: 0

// //         ...
// //         7'b1111111: 0;


// // end


module Synapse_BRAM(
                    clk,         // 클럭 신호
                    addr,  // 주소 신호 (8비트)
                    data,  // 데이터 입력 (8비트)
                    w_EN,    // 쓰기 활성화 신호
                    q      // 데이터 출력 (8비트)
);

input clk,         // 클럭 신호
input [7:0] addr,  // 주소 신호 (8비트)
input [7:0] data,  // 데이터 입력 (8비트)
input W_EN,    // 쓰기 활성화 신호
output reg [7:0] q 

// BRAM 메모리 배열 선언
reg [7:0] BRAM [0:255];

// 읽기 및 쓰기 로직
always @(posedge clk) begin
    if (write_en) begin
        BRAM[addr] <= data; // 주소에 데이터를 쓴다.
    end
    else 
        q <= BRAM[addr]; // 주소에서 데이터를 읽는다.
end

endmodule