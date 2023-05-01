
// path info  windows: C:/Users/{user}/Documents/OpenSCAD/libraries
include <kea_constructive.scad>

length = 50 ;
thickness = 10;
inner_width = 3;
width = 2*thickness;
hook_percentage = 50.0 / 100;
hook_length = length * hook_percentage;
$fn=50;
height = 20;

cut_width = (width)/2;
thickx = 1.3*thickness;
offsety = thickx - width/2 - 1.5;
module open_tube(left) {
  difference()  {
    tube(d=width,h=height,wall=width/4);
    X(left*width/2) box((width)/2 ,x=width,h=2.5*height);
  }///difference()
}


module cut_tube(left) {
  difference()  {
    tube(d=thickx,h=height,wall=width/4);
    X(left*width/2) Y(left*thickx/4) box((thickx) ,x=width,h=2.5*height);
  }///difference()
}



//Y(0*width+thickness/2) tube(d=thickness,h=height,wall=thickness);

{
Y(0*width+thickness/2+offsety) cut_tube(1);
X(length/4) Y(thickness/4) box(length/2,y=thickness/2,h=height);
Y(0.5*width) X(+hook_length) open_tube(-1);
Y(width-thickness/4) box(length,y=thickness/2,h=height);
Y(1.5*width-thickness/2) X(-hook_length) open_tube(+1);
X(-length/4) Y(2*width-(thickness*3/4)) box(length/2,y=thickness/2,h=height);
Y(2*width-(thickness)-offsety) cut_tube(-1);
} ///union() 