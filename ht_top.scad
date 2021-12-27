include <nutsnbolts/cyl_head_bolt.scad>; // https://github.com/JohK/nutsnbolts

$fa = 1;
$fs = 0.4;

pipe_radius=22/2;

///// dimensions for ht clip mount box (choose baofeng or ft60r)
//// original (baofeng)
//mnt_width = 22.23;
//mnt_height = 11.09;
//mnt_depth = 52.53;
//mnt_wall = 3;
//hole_width = 14.29; // ht clip hole
//hole_height = 11.05; // ht clip hole

//// ft-60r
mnt_width = 30;
mnt_height = 15;
mnt_depth = 57;
mnt_wall = 3;
hole_width = 27; // ht clip hole
hole_height = 11.05; // ht clip hole

 
// main body with cutout for pipe
difference() {   
    // main body cube
    cube([38.10, 76.2, 17.46], center=true);
        rotate([90, 0, 0])

    // bottom cylinder to hold pipe
    translate([0, -(17.46/2), 0])
        cylinder(h = 80, r = pipe_radius, center=true);
    
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

// ht mnt on top
difference() {
    // ht mount box
    translate([0, 0, 17.46-mnt_wall])
        cube([mnt_width+mnt_wall, mnt_depth, mnt_height+mnt_wall], center=true);
        // clip hole on top
    translate([0,(mnt_depth/2)-(hole_height/2)-mnt_wall,(17.46/2)+(mnt_height/2)+mnt_wall])
        cube([hole_width, hole_height, mnt_wall*5], center = true);
    // clip cavity
    translate([0, -mnt_wall, 17.46-mnt_wall])  
        cube([mnt_width, mnt_depth, mnt_height], center=true);

}

