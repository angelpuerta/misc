fox =[[0,14], [6,16], [8,23], [11,20],[15,20], [18, 23], [22, 14], [20,9], [22, 0], [2,0], [8, 9], [2,11]];

$fn=360;

module meeple (points){
    color("pink")
    linear_extrude(1, center = true)
    resize([16, 21]) polygon(points);
}


module eye (){
        difference(){
            resize([2,4])
            linear_extrude(1, center = true)
            circle(1);
            linear_extrude(2, center = true)
            resize([1.2,3.2])
            circle(1, $fn=20);
        }

        intersection(){
                translate([1.5,-1,0])
                rotate([-180,0,210])
                rotate_extrude(angle = 100)
                translate([2, 0, 0])
                square(size=[0.4,1], center=true);
                linear_extrude(4, center=true)
                resize([2,4])
                circle(1);
            }
}


function get_pair(x, radius) = [x, 
    let (b = -2*radius)
    let (c = (x)^2)
    (-b - sqrt((b*b)-4*1*c))/(2*1)];

 module teeth(){
     union(){
         rotate([0,0,-90])
         translate([-10,0,0])
         rotate_extrude(angle = 35)
         translate([10, 0, 0])
         square(size=[0.5,1], center=true);
         linear_extrude(height=1, center=true)
         difference(){
             polygon([get_pair(3,10),[5,0], [5.3, 0.1], get_pair(5.7,10)]);
             polygon([get_pair(3.3,10),[5,0.4], get_pair(5.4,10)]);
         }
 }
 }

module eye_brow(){
    intersection(){
        linear_extrude(height=1, center=true)
        polygon([[0,0], [0,2], [3,2]]);
        translate([2.5,-0.75,0])
        rotate([0,0,90])
        rotate_extrude(angle = 90)
        translate([2, 0, 0])
        square(size=[1,1], center=true);
    }
}

module fox(){
    difference(){
        meeple(fox);
        union(){
            translate([2.5,10.5, 0.5])
            teeth();
            translate([11.5,14,  0.5])
            eye();
            translate([9.5,15.5,  0.5])
            eye_brow();
        }
    }
}

color("pink")
scale([1,1,4])
meeple(fox);
color("pink")
translate([0,0,4])
scale([1,1,5])
fox();
