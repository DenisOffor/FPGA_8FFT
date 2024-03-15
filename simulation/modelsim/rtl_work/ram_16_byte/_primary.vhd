library verilog;
use verilog.vl_types.all;
entity ram_16_byte is
    generic(
        N               : integer := 16
    );
    port(
        i_rst           : in     vl_logic;
        we              : in     vl_logic;
        in0_re          : in     vl_logic_vector;
        in0_im          : in     vl_logic_vector;
        in1_re          : in     vl_logic_vector;
        in1_im          : in     vl_logic_vector;
        in2_re          : in     vl_logic_vector;
        in2_im          : in     vl_logic_vector;
        in3_re          : in     vl_logic_vector;
        in3_im          : in     vl_logic_vector;
        in4_re          : in     vl_logic_vector;
        in4_im          : in     vl_logic_vector;
        in5_re          : in     vl_logic_vector;
        in5_im          : in     vl_logic_vector;
        in6_re          : in     vl_logic_vector;
        in6_im          : in     vl_logic_vector;
        in7_re          : in     vl_logic_vector;
        in7_im          : in     vl_logic_vector;
        in8_re          : in     vl_logic_vector;
        in8_im          : in     vl_logic_vector;
        in9_re          : in     vl_logic_vector;
        in9_im          : in     vl_logic_vector;
        in10_re         : in     vl_logic_vector;
        in10_im         : in     vl_logic_vector;
        in11_re         : in     vl_logic_vector;
        in11_im         : in     vl_logic_vector;
        in12_re         : in     vl_logic_vector;
        in12_im         : in     vl_logic_vector;
        in13_re         : in     vl_logic_vector;
        in13_im         : in     vl_logic_vector;
        in14_re         : in     vl_logic_vector;
        in14_im         : in     vl_logic_vector;
        in15_re         : in     vl_logic_vector;
        in15_im         : in     vl_logic_vector;
        out0_re         : out    vl_logic_vector;
        out0_im         : out    vl_logic_vector;
        out1_re         : out    vl_logic_vector;
        out1_im         : out    vl_logic_vector;
        out2_re         : out    vl_logic_vector;
        out2_im         : out    vl_logic_vector;
        out3_re         : out    vl_logic_vector;
        out3_im         : out    vl_logic_vector;
        out4_re         : out    vl_logic_vector;
        out4_im         : out    vl_logic_vector;
        out5_re         : out    vl_logic_vector;
        out5_im         : out    vl_logic_vector;
        out6_re         : out    vl_logic_vector;
        out6_im         : out    vl_logic_vector;
        out7_re         : out    vl_logic_vector;
        out7_im         : out    vl_logic_vector;
        out8_re         : out    vl_logic_vector;
        out8_im         : out    vl_logic_vector;
        out9_re         : out    vl_logic_vector;
        out9_im         : out    vl_logic_vector;
        out10_re        : out    vl_logic_vector;
        out10_im        : out    vl_logic_vector;
        out11_re        : out    vl_logic_vector;
        out11_im        : out    vl_logic_vector;
        out12_re        : out    vl_logic_vector;
        out12_im        : out    vl_logic_vector;
        out13_re        : out    vl_logic_vector;
        out13_im        : out    vl_logic_vector;
        out14_re        : out    vl_logic_vector;
        out14_im        : out    vl_logic_vector;
        out15_re        : out    vl_logic_vector;
        out15_im        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end ram_16_byte;
