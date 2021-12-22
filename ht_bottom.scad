include <nutsnbolts/cyl_head_bolt.scad>; // https://github.com/JohK/nutsnbolts

$fa = 1;
$fs = 0.4;

handle_length=50;

// main body with cutout for pipe
rotate([180, 0, 0])
difference() {   
    // main body cube
    cube([38.10, 76.2, 17.46], center=true);
        rotate([90, 0, 0])

    // bottom cylinder to hold pipe
    translate([0, -(17.46/2), 0])
        cylinder(h = 80, r = 10.545, center=true);
    
    // nut holes
    translate([-28.18/2, -65.09/2, (17.46)/2])
        nutcatch_parallel("M3", clh=0.1);
    translate([-28.18/2, -65.09/2, 50+(17.46)/2])
        hole_through(name="M3", l=50+5+10, cld=0.1, h=10, hcld=0.4);
    
    translate([28.18/2, -65.09/2, (17.46)/2])
        nutcatch_parallel("M3", clh=0.1);
    translate([28.18/2, -65.09/2, 50+(17.46)/2])
        hole_through(name="M3", l=50+5+10, cld=0.1, h=10, hcld=0.4);
    
    translate([-28.18/2, 65.09/2, (17.46)/2])
        nutcatch_parallel("M3", clh=0.1);
    translate([-28.18/2, 65.09/2, 50+(17.46)/2])
        hole_through(name="M3", l=50+5+10, cld=0.1, h=10, hcld=0.4);
    
    translate([28.18/2, 65.09/2, (17.46)/2])
        nutcatch_parallel("M3", clh=0.1);
    translate([28.18/2, 65.09/2, 50+(17.46)/2])
        hole_through(name="M3", l=50+5+10, cld=0.1, h=10, hcld=0.4);

}

// handle
translate([0, 15, -handle_length-(17.46/2)+7])
    rotate([20, 0, 0])
    cylinder(h = handle_length, r = 7.5);