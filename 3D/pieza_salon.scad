border = 0.35;
x = 7.5;
y = 4.5;
z = 2.8;
viz_param = 0.1;

z_diff = z - (border*2);
w_diff = x - (border*2);

tab_position = [
0, y/2, z/2
];

$fn=360;
module rounded_cube(x,y,z){
    minkowski(){
     cube([x,y,z], center = true);
     cylinder(h=0.000001, r=0.15, center=true);   
    }
}

union() {
    difference(){
        rounded_cube(x, y, z);
        rounded_cube(w_diff + viz_param, y + viz_param, z_diff + viz_param);
        }

translate(tab_position)
translate([0,-border/2+viz_param+viz_param/2,-border-viz_param])
cube([4, border, 0.75,], center = true);
}
