//Mark Benson
// CC NC 2013
//
//i3 Spool holder
//
//Spool spindle holder

translate([0,-33,14]) rotate(a=90, v=[0,1,0])difference()
{
	union()
	{
		//main body of part
		union()
		{
			cube([14,20,14]);
			translate([0,20,0]) rotate([45,0,0]) cube([14,18,14]);
		}

	}

	union()
	{
		//splindle cut away
		union()
		{
			translate([-3,3,8]) cube([20,8,10]);
			translate([-3,7,8]) rotate(a=90, v=[0,1,0]) cylinder(r=4, h=20);
		}

		//shaft cut out
		translate([7,37,0]) rotate(a=45, v=[1,0,0]) cylinder(r=3.5, h=30);

	}
}