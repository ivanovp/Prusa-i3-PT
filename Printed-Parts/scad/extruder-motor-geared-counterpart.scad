height = 8;
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

difference()
{
    translate([0,-42,0]) cube([42,42,height]);
    translate([0, 0, cutout_height + (height - cutout_height) / 2]) rotate([0, 0, 45]) cube([7,7,height - cutout_height], center=true);
    translate([-30,-42,0]) cube([51,cutout_width,height]);
    
    translate([0,-42,cutout_height]) cube([42,42,height - cutout_height]);
    //base round cutout
    translate([21,-21,-2]) cylinder(r=9, h=33, $fn=200);
    translate([21,-21,2.5]) cylinder(r=11, h=7, $fn=200);
    
    translate([21,-21,0]) screws();
}