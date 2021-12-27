include <nutsnbolts/cyl_head_bolt.scad>; // https://github.com/JohK/nutsnbolts

$fa = 1;
$fs = 0.4;

handle_length=120;
pipe_radius=22/2;

// main body with cutout for pipe
rotate([180, 0, 0])
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

// handle
difference() {
    translate([0, 10, -(handle_length/2)+10])
        rotate([18, 0, 0])
        difference() {
            cube([20, 50, handle_length], center = true);

            translate([0, 0, -5])
            difference() {
                cylinder(h = 115, r1 = 30, r2 = 30, center=true);
                cylinder(h = 115, r1 = 15, r2 = 15, center=true);
            }
        }

    // make handle flush with surface of main body
    translate([-38.1, -76.2/2, -(17.46/2)])
        cube([100, 100, 50]);
}
