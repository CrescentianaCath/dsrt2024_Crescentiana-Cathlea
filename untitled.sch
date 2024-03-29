v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 250 -260 280 -260 {
lab=in}
N 250 -260 250 -140 {
lab=in}
N 250 -140 280 -140 {
lab=in}
N 200 -200 200 -150 {
lab=in}
N 200 -200 250 -200 {
lab=in}
N 80 -320 80 -150 {
lab=#net1}
N 80 -320 320 -320 {
lab=#net1}
N 320 -320 320 -290 {
lab=#net1}
N 320 -320 410 -320 {
lab=#net1}
N 410 -320 410 -260 {
lab=#net1}
N 320 -230 320 -170 {
lab=#net2}
N 320 -110 320 -80 {
lab=GND}
N 320 -80 320 -60 {
lab=GND}
N 200 -90 200 -60 {
lab=GND}
N 80 -90 80 -60 {
lab=GND}
N 80 -60 200 -60 {
lab=GND}
N 200 -60 320 -60 {
lab=GND}
N 310 -140 400 -140 {
lab=GND}
N 400 -140 400 -60 {
lab=GND}
N 320 -60 400 -60 {
lab=GND}
N 320 -200 400 -200 {
lab=#net2}
N 320 -260 410 -260 {
lab=#net1}
N 200 -60 200 -40 {
lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 300 -140 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/vsource.sym} 200 -120 0 0 {name=V1 value=0 savecurrent=false}
C {devices/vsource.sym} 80 -120 0 0 {name=V2 value=1.8 savecurrent=false}
C {sky130_fd_pr/pfet_01v8.sym} 300 -260 0 0 {name=M2
W=3
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 200 -200 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 430 -190 0 0 {name=p2 sig_type=std_logic lab=out}
C {devices/gnd.sym} 200 -40 0 0 {name=l1 lab=GND}
C {devices/code.sym} 460 -160 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval(@value)"
value=".lib\\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {devices/code_shown.sym} 450 -380 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
dc v2 0 1.8 0.01
plot in out
op
.endc
"}
