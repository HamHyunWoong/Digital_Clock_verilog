transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/seven_seg_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/dff_async_reset.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/counter_mod_25000000.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/clk_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/bcd_to_seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/mod_6_re_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/mod_10_re_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/state_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/slotcounter.v}
vlog -vlog01compat -work work +incdir+C:/Users/COM29/Desktop/test2\ (2) {C:/Users/COM29/Desktop/test2 (2)/gamemain.v}

