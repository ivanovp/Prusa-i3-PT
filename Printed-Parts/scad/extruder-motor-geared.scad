height = 15;
cutout_width = 20;
cutout_height = 6;

module screws()
{
    // Top right
    translate([-15.5,-15.5,4]) cylinder(r=1.65, h=50, $fn=30);  // Screw hole
    translate([-15.5,-15.5,-1]) cylinder(r=3.1, h=4.5, $fn=30); // Head cut

    // Bottom right
    translate([-15.5,15.5,4]) cylinder(r=1.65, h=50, $fn=30);   // Screw hole
    translate([-15.5,15.5,-1]) cylinder(r=3.1, h=4.5, $fn=30);  // Head cut

    // Top left
    translate([15.5,-15.5,4]) cylinder(r=1.65, h=50, $fn=30);   // Screw hole
    translate([15.5,-15.5,-1]) cylinder(r=3.1, h=4.5, $fn=30);  // Head cut

    // Bottom left
    translate([15.5,15.5,4]) cylinder(r=1.65, h=50, $fn=30);    // Screw hole
    translate([15.5,15.5,-1]) cylinder(r=3.1, h=4.5, $fn=30);   // Head cut
}

module motor_holder()
{
    difference()
    {
        union()
        {
            cube([42,42+2,height]);
            triangle_points =[[42,0], [0,0], [0, -8], [15, -8], [30,-27]];
            triangle_paths =[[0, 1, 2, 3, 4]];
            linear_extrude(height=height) polygon(triangle_points,triangle_paths,10);
        }

        translate([0,-50,cutout_height]) cube([42,42+2+50,height - cutout_height]);
        translate([0,-42,-1]) cube([22,22,height + 2]);
        
        // motor's shaft
        translate([21,21+3,-2])   cylinder(r=11.5, h=33, $fn=200);
        translate([21,21+2.5,-2]) cylinder(r=11.5, h=33, $fn=200);
        translate([21,21+2,-2])   cylinder(r=11.5, h=33, $fn=200);
        translate([21,21+1.5,-2]) cylinder(r=11.5, h=33, $fn=200);
        translate([21,21+1,-2])   cylinder(r=11.5, h=33, $fn=200);
        translate([21,21+0.5,-2]) cylinder(r=11.5, h=33, $fn=200);
        translate([21,21,-2])     cylinder(r=11.5, h=33, $fn=200);
        translate([21,21-0.5,-2]) cylinder(r=11.5, h=33, $fn=200);
        
        // stepper motor's screws
        translate([21,21+3,0])   screws();
        translate([21,21+2.5,0]) screws();
        translate([21,21+2,0])   screws();
        translate([21,21+1.5,0]) screws();
        translate([21,21+1,0])   screws();
        translate([21,21+0.5,0]) screws();
        translate([21,21,0])     screws();
        translate([21,21-0.5,0]) screws();
    }
}

tx = -5.5;
ty = -23;
rot = 75;

difference()
{
    union()
    {
        translate([0,-42,0]) cube([42,42,height]);
        translate([tx, ty, 0]) rotate([0, 0, rot]) motor_holder();
    }
    // to be sure that motor's space is reserved
    translate([tx, ty, cutout_height]) rotate([0, 0, rot]) cube([42,42+2,height - cutout_height]);
    translate([0, 0, cutout_height + (height - cutout_height) / 2]) rotate([0, 0, 45]) cube([7,7,height - cutout_height], center=true);
    translate([-30,-42,0]) cube([51,cutout_width,height]);
    
    //translate([0,-21-cutout_width/2,cutout_height]) cube([42,cutout_width,height - cutout_height]);
    //translate([21-cutout_width/2,-42,cutout_height]) cube([cutout_width,42,height - cutout_height]);
    translate([0,-42,cutout_height]) cube([42,42,height - cutout_height]);
    //base round cutout
    translate([21,-21,-2]) cylinder(r=9, h=33, $fn=200);
    translate([21,-21,2.5]) cylinder(r=11, h=7, $fn=200);
    
    translate([21,-21,0]) screws();
}