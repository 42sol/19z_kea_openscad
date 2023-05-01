
// path info  windows: C:/Users/{user}/Documents/OpenSCAD/libraries
include <kea_constructive.scad>
length = 100;
thickness = 10;
inner_width = 2;
width = inner_width + 2*thickness;
hook_percentage = 50.0 / 100;
hook_length = length * hook_percentage;

height = 20;


difference() {
union() {
Z(height/2) linear_extrude(height) bentStrip([X(hook_length),turnXY(90),X(width), turnXY(-90),X(-length), turnXY(90), X(width), turnXY(90), X(-hook_length)]) circle(thickness/2);
  Z(height) union() {
    Y(0*width+thickness/2)                   tube(d=thickness*2,h=height,wall=thickness);
    Y(0.5*width) X(+hook_length) tube(d=width+thickness,h=height,wall=thickness);
    Y(1.5*width) X(-hook_length) tube(d=width+thickness,h=height,wall=thickness);
    Y(2*width-thickness/2)                   tube(d=thickness*2 ,h=height,wall=thickness);
  }}
  
  Z(height)  union(){
    X(length/3) Y(width/2) box(thickness*1.2,x=length/3,h=2.5*height);
    X(-length/3) Y(3*width/2) box(thickness*1.2,x=length/3,h=2.5*height);
    Y(0.5*width) X(+hook_length) tube(d=width/2*1.1,h=22,wall=thickness);
    Y(1.5*width) X(-hook_length) tube(d=width/2*1.1,h=22,wall=thickness);
  }

};