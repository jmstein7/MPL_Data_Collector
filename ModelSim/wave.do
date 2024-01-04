onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Testbench Signals}
add wave -noupdate /tb_ept_epm570_top/aa
add wave -noupdate /tb_ept_epm570_top/bc_in
add wave -noupdate /tb_ept_epm570_top/bc_out
add wave -noupdate /tb_ept_epm570_top/num_block_cycles
add wave -noupdate /tb_ept_epm570_top/num_read_cycles
add wave -noupdate /tb_ept_epm570_top/bd_inout
add wave -noupdate -divider {Host Active Transfer}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_cmd_to_device
add wave -noupdate -divider {Host Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_control_word
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_bit
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_cmd_to_device
add wave -noupdate -divider {Host Active Block}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_block/block_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_block/block_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_block/block_control_word
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_block/block_cmd_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_block/byte_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_block/block_write_word
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/block_read_array
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/block_write_array
add wave -noupdate -divider {Host Control Register}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_control_register/transfer_cmd_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_control_register/control_register_byte
add wave -noupdate -divider {Host Check Status}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_status_byte
add wave -noupdate -divider {Host Write Bus}
add wave -noupdate /tb_ept_epm570_top/host_write_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_data_in
add wave -noupdate -divider {Host Read Bus}
add wave -noupdate -divider DUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/aa
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bd_inout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_1
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_2
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_3
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/CLK_66
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/RST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/LB_IOL
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_out_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_in_byte
add wave -noupdate -divider LEDs
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/LED
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_in_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_in_store
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/led_reset
add wave -noupdate -divider {Block Loopback}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_out_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_out_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/start_block_transfer
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/start_block_transfer_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_byte_ready
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_out_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_out_state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_out_index
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_out_start
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_in_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_in_rcv
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_in_loopback
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ept_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_in_state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/block_in_index
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/mem_array_full_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/mem_array
add wave -noupdate -divider {Active Trigger EndTerm}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_reset
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/to_trigupdate
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host_flag
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/previous_to_trigupdate
add wave -noupdate -divider {Active Transfer EndTerm}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/uc_clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/uc_reset
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/uc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/start_transfer
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/uc_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/state_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/next_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_to_device_reset
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/start_transfer_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/to_transfer_update
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_to_device_meta
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/start_transfer_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/start_transfer_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/transfer_busy_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_INST/state_name
add wave -noupdate -divider {Active Block EndTerm}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_reset
add wave -noupdate -radix hexadecimal -childformat {{{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[23]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[22]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[21]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[20]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[19]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[18]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[17]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[16]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[15]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[14]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[13]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[12]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[11]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[10]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[9]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[8]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[7]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[6]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[5]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[4]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[3]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[2]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[1]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[0]} -radix hexadecimal}} -subitemconfig {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[23]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[22]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[21]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[20]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[19]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[18]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[17]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[16]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[15]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[14]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[13]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[12]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[11]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[10]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[9]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[8]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[7]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[6]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[5]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[4]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[3]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[2]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[1]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in[0]} {-height 15 -radix hexadecimal}} /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_in
add wave -noupdate -radix hexadecimal -childformat {{{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[21]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[20]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[19]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[18]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[17]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[16]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[15]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[14]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[13]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[12]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[11]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[10]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[9]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[8]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[7]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[6]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[5]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[4]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[3]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[2]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[1]} -radix hexadecimal} {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[0]} -radix hexadecimal}} -subitemconfig {{/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[21]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[20]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[19]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[18]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[17]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[16]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[15]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[14]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[13]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[12]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[11]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[10]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[9]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[8]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[7]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[6]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[5]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[4]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[3]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[2]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[1]} {-height 15 -radix hexadecimal} {/tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out[0]} {-height 15 -radix hexadecimal}} /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/start_transfer
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/transfer_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/transfer_ready
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/transfer_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/ept_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/uc_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/transfer_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/transfer_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/state_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/next_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/transfer_received_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/block_transfer_state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/data_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/block_transfer_state_counter
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/BLOCK_TRANSFER_INST/state_name
add wave -noupdate -divider {Active Transfer Library}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/aa
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/bc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/bc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/bd_inout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/UC_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/register_decode
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/data_byte_ready
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ept_int_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ept_int_write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ft_245_state_mne_write_ready
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ept_int_write_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/write_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ft_usb_data_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ft_usb_data_in
add wave -noupdate -divider FT_245_State_Machine
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_REGISTER_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RSB_INT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_rxf_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_txe_n_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state_name
add wave -noupdate -divider {Endpoint Registers}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_OUT
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_name
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/data_byte_ready_delay_cnt
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/control_multiplexor
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_en_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/payload_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_payload
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/block_read_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/transfer_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_counter
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command_meta
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_out_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host_reg
add wave -noupdate -divider {Host Bus Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RESET_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_PWREN_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_DATA
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/WRITE_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_STATUS
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_rdy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_write_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_model_write_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_hold_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_transmit_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/model_read_host_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/transmit_byte_storage
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/ft_status_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_byte_available
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_wren
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_rden
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_dout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/data_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_fifo_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/temp_byte
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_name
add wave -noupdate -divider {Sync FIFO}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_enable
add wave -noupdate -divider {Read Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_addr
add wave -noupdate -divider {Write Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_addr
add wave -noupdate -divider {Host Read Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_READ_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/START_READ_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_RDY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/ft245_rd_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state_name
add wave -noupdate -divider {Host Write Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/START_WRITE_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/WRITE_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_count
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state_name
add wave -noupdate -divider {Testbench Signals}
add wave -noupdate /tb_ept_epm570_top/aa
add wave -noupdate /tb_ept_epm570_top/bc_in
add wave -noupdate /tb_ept_epm570_top/bc_out
add wave -noupdate /tb_ept_epm570_top/num_block_cycles
add wave -noupdate /tb_ept_epm570_top/num_read_cycles
add wave -noupdate /tb_ept_epm570_top/bd_inout
add wave -noupdate -divider {Host Active Transfer}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_cmd_to_device
add wave -noupdate -divider {Host Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_control_word
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_bit
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_cmd_to_device
add wave -noupdate -divider {Host Control Register}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_control_register/transfer_cmd_to_device
add wave -noupdate -divider {Host Check Status}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_status_byte
add wave -noupdate -divider {Host Write Bus}
add wave -noupdate /tb_ept_epm570_top/host_write_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_data_in
add wave -noupdate -divider {Host Read Bus}
add wave -noupdate -divider DUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/aa
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bd_inout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_1
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_2
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_3
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/CLK_66
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/RST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/LB_IOL
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_out_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_in_byte
add wave -noupdate -divider {Load Timer Value}
add wave -noupdate -divider {Load Seed Value}
add wave -noupdate -divider {Load LED Count}
add wave -noupdate -divider {Start Blinky}
add wave -noupdate -divider {LED State Machine}
add wave -noupdate -divider {Linear Feedback Shift Reg}
add wave -noupdate -divider {Control Register}
add wave -noupdate -divider {Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_reset
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/to_trigupdate
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host_flag
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/previous_to_trigupdate
add wave -noupdate -divider {Active Transfer}
add wave -noupdate -divider FT_245_State_Machine
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_REGISTER_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RSB_INT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_rxf_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_txe_n_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state_name
add wave -noupdate -divider {Endpoint Registers}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_OUT
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_name
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/data_byte_ready_delay_cnt
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/control_multiplexor
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_en_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/payload_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_payload
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/block_read_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/transfer_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_counter
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command_meta
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_out_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host_reg
add wave -noupdate -divider {Host Bus Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RESET_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_PWREN_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_DATA
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/WRITE_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_STATUS
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_rdy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_write_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_model_write_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_hold_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_transmit_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/model_read_host_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/transmit_byte_storage
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/ft_status_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_byte_available
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_wren
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_rden
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_dout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/data_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_fifo_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/temp_byte
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_name
add wave -noupdate -divider {Sync FIFO}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_enable
add wave -noupdate -divider {Read Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_addr
add wave -noupdate -divider {Write Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_addr
add wave -noupdate -divider {Host Read Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_READ_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/START_READ_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_RDY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/ft245_rd_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state_name
add wave -noupdate -divider {Host Write Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/START_WRITE_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/WRITE_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_count
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state_name
add wave -noupdate -divider {Testbench Signals}
add wave -noupdate /tb_ept_epm570_top/aa
add wave -noupdate /tb_ept_epm570_top/bc_in
add wave -noupdate /tb_ept_epm570_top/bc_out
add wave -noupdate /tb_ept_epm570_top/num_block_cycles
add wave -noupdate /tb_ept_epm570_top/num_read_cycles
add wave -noupdate /tb_ept_epm570_top/bd_inout
add wave -noupdate -divider {Host Active Transfer}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_cmd_to_device
add wave -noupdate -divider {Host Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_control_word
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_bit
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_cmd_to_device
add wave -noupdate -divider {Host Control Register}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_control_register/transfer_cmd_to_device
add wave -noupdate -divider {Host Check Status}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_status_byte
add wave -noupdate -divider {Host Write Bus}
add wave -noupdate /tb_ept_epm570_top/host_write_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_data_in
add wave -noupdate -divider {Host Read Bus}
add wave -noupdate -divider DUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/aa
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bd_inout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_1
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_2
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_3
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/CLK_66
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/RST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/LB_IOL
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_out_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_in_byte
add wave -noupdate -divider {Load Timer Value}
add wave -noupdate -divider {Load Seed Value}
add wave -noupdate -divider {Load LED Count}
add wave -noupdate -divider {Start Blinky}
add wave -noupdate -divider {LED State Machine}
add wave -noupdate -divider {Linear Feedback Shift Reg}
add wave -noupdate -divider {flip flop}
add wave -noupdate -divider mux
add wave -noupdate -divider {Control Register}
add wave -noupdate -divider {Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_reset
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/to_trigupdate
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host_flag
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/previous_to_trigupdate
add wave -noupdate -divider {Active Transfer}
add wave -noupdate -divider FT_245_State_Machine
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_REGISTER_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RSB_INT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_rxf_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_txe_n_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state_name
add wave -noupdate -divider {Endpoint Registers}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_OUT
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_name
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/data_byte_ready_delay_cnt
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/control_multiplexor
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_en_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/payload_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_payload
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/block_read_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/transfer_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_counter
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command_meta
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_out_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host_reg
add wave -noupdate -divider {Host Bus Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RESET_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_PWREN_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_DATA
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/WRITE_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_STATUS
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_rdy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_write_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_model_write_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_hold_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_transmit_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/model_read_host_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/transmit_byte_storage
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/ft_status_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_byte_available
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_wren
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_rden
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_dout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/data_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_fifo_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/temp_byte
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_name
add wave -noupdate -divider {Sync FIFO}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_enable
add wave -noupdate -divider {Read Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_addr
add wave -noupdate -divider {Write Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_addr
add wave -noupdate -divider {Host Read Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_READ_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/START_READ_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_RDY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/ft245_rd_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state_name
add wave -noupdate -divider {Host Write Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/START_WRITE_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/WRITE_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_count
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state_name
add wave -noupdate -divider {Testbench Signals}
add wave -noupdate /tb_ept_epm570_top/aa
add wave -noupdate /tb_ept_epm570_top/bc_in
add wave -noupdate /tb_ept_epm570_top/bc_out
add wave -noupdate /tb_ept_epm570_top/num_block_cycles
add wave -noupdate /tb_ept_epm570_top/num_read_cycles
add wave -noupdate /tb_ept_epm570_top/bd_inout
add wave -noupdate -divider {Host Active Transfer}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_transfer/transfer_cmd_to_device
add wave -noupdate -divider {Host Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_control_word
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_bit
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_trigger/trigger_cmd_to_device
add wave -noupdate -divider {Host Control Register}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/send_control_register/transfer_cmd_to_device
add wave -noupdate -divider {Host Check Status}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_status_byte
add wave -noupdate -divider {Host Write Bus}
add wave -noupdate /tb_ept_epm570_top/host_write_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/host_data_in
add wave -noupdate -divider {Host Read Bus}
add wave -noupdate -divider DUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/aa
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/bd_inout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_1
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_2
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/TR_OE_3
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/CLK_66
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/RST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/UC_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/LB_IOL
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_out_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/transfer_in_received
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/trigger_in_byte
add wave -noupdate -divider {Load Timer Value}
add wave -noupdate -divider {Load Seed Value}
add wave -noupdate -divider {Load LED Count}
add wave -noupdate -divider {Start Blinky}
add wave -noupdate -divider {LED State Machine}
add wave -noupdate -divider {Linear Feedback Shift Reg}
add wave -noupdate -divider {Control Register}
add wave -noupdate -divider {Active Trigger}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_reset
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/uc_out
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/to_trigupdate
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/trigger_to_host_flag
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRIGGER_INST/previous_to_trigupdate
add wave -noupdate -divider {Active Transfer}
add wave -noupdate -divider FT_245_State_Machine
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_REGISTER_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/USB_DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/RSB_INT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/read_complete_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/write_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_rxf_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/usb_txe_n_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/FT_245_STATE_MACHINE_INST/state_name
add wave -noupdate -divider {Endpoint Registers}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_DECODE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/DATA_BYTE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/ENDPOINT_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_EN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_READY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/WRITE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/UC_OUT
add wave -noupdate -radix ascii /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_name
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/data_byte_ready_delay_cnt
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/control_multiplexor
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_control_mux_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_en_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/payload_from_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_payload
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_address
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_in_length
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/command_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/address_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/length_to_device
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/block_read_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/byte_count_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/transfer_busy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/reset_uc_in_counter
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/uc_out_command_meta
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/state_out_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/DUT/ACTIVE_TRANSFER_LIBRARY_INST/ENDPOINT_REGISTERS_INST/write_to_host_reg
add wave -noupdate -divider {Host Bus Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_RESET_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_PWREN_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_TEST
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_FT245_DATA
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_IN
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/DATA_OUT
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/WRITE_FT_245
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/READ_FT_STATUS
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_rdy
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_meta_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/start_write_cycle
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_model_write_cycle_complete
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_hold_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_transmit_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/model_read_host_data_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/transmit_byte_storage
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/ft_status_byte
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_ft_status_cntr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/host_byte_available
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/next_read_fifo
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_wren
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_rden
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_dout
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/data_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/read_fifo_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/write_cycle_complete_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/temp_byte
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/state_name
add wave -noupdate -divider {Sync FIFO}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_data
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/write_enable
add wave -noupdate -divider {Read Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_req
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/rdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_empty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/fifo_aempty
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/read_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_READ_CTRL/write_addr
add wave -noupdate -divider {Write Control Logic}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/wdata_valid
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/flush
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/reset_n
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/clk
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ack
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_ptr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_full
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/fifo_afull
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/write_addr
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/FIFO/U_WRITE_CTRL/read_addr
add wave -noupdate -divider {Host Read Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RXF_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_RD_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/HOST_FT245_READ_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/START_READ_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_RDY
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/READ_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/start_read_cycle_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/ft245_rd_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/rxf_n_delay_reg
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_READ/state_name
add wave -noupdate -divider {Host Write Model}
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/CLK
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/RST_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_TXE_N
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WR
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/HOST_FT245_WRITE_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/TRANSMIT_BYTE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/START_WRITE_CYCLE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/WRITE_CYCLE_COMPLETE
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/next
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/output_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_enable_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/txe_delay_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/host_ft245_txe_n_count
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_reg
add wave -noupdate -radix hexadecimal /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/write_byte_control_count
add wave -noupdate -radix ascii /tb_ept_epm570_top/HOST_FT_245_MODEL_INST/HOST_WRITE/state_name
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 19} {7254725913 ps} 0} {{Cursor 3} {5367056247 ps} 0} {{Cursor 4} {6848272500 ps} 0} {{Cursor 5} {332842500 ps} 0}
quietly wave cursor active 4
configure wave -namecolwidth 227
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {7683032239 ps} {7683524619 ps}
