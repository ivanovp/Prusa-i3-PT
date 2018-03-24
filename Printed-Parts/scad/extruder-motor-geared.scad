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
            triangle_points =[[20,0],[30,-27],[42,0]];
            triangle_paths =[[0,1,2]];
            linear_extrude(height=height) polygon(triangle_points,triangle_paths,10);
            /*intersection()
            {
                translate([21,0,0]) cylinder(r=21,height, $fn=30);
                translate([21,-21,0]) cube([21,21,height]);
            }*/
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

difference()
{
    union()
    {
        difference()
        {
            translate([0,-42,0]) cube([42,42,height]);
            translate([0,-19.5,0]) cube([3,7,height]);
        }
        translate([2, -23, 0]) rotate([0, 0, 75]) motor_holder();
        //translate([3, -23, 0]) rotate([0, 0, 75]) motor_holder();
    }
    translate([-30,-42,0]) cube([51,cutout_width,height]);
    
    translate([0,-21-cutout_width/2,cutout_height]) cube([42,cutout_width,height - cutout_height]);
    translate([21-cutout_width/2,-42,cutout_height]) cube([cutout_width,42,height - cutout_height]);
    //base round cutout
    translate([21,-21,-2]) cylinder(r=10.5, h=33, $fn=200);
    translate([21,-21,-2]) cylinder(r=11, h=7, $fn=200);
    
    translate([21,-21,0]) screws();
}