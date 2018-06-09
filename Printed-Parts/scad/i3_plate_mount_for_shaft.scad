//Mark Benson
// CC NC 2013
//Christian Ege
// Modified 2014-09-07
// Modified by Peter Ivanov <ivanovp@gmail.com>, 2018-06-09
//
//Prusa i3 Spool holder
//
//Shaft to i3 plate mount



translate([10,47,0]) rotate(a=90, v=[1,0,0]) difference()
{
	union()
	{
	translate([-2.0,0,-40]) cube([22,20,70]);
	translate([-14,0,40]) rotate([0,45,0]) cube([30,20,10]);
   
	}

	union()

	union()
	{
	translate([-2.0 + 22 / 2 - 10.3 / 2,0,-40]) cube([10.3,30,58]);
	translate([20,0,20]) rotate(a=-45, v=[0,1,0]) cube([20,20,20]);
	translate([-14,10,30]) rotate(a=45, v=[0,1,0]) cylinder(r=4.0, h=20, $fn=100);
	#translate([-5,10,-36]) rotate(a=90, v=[0,1,0]) cylinder(r=2.1, h=30, $fn=100);
	//rotate([0,90,0]) translate([26,10,-5]) cylinder(r=1.8, h=25, $fn=100);
	}
}

		//main body of part
		//union()
		//{
		//	cube([14,20,14]);
		//	translate([0,20,0]) rotate([45,0,0]) cube([14,18,14]);
		//}

		//splindle cut away
		//union()
		//{
		//	translate([-3,3,8]) cube([20,8,10]);
		//	translate([-3,7,8]) rotate(a=90, v=[0,1,0]) cylinder(r=4, h=20);
		//}

		//shaft cut out
		//translate([7,37,0]) rotate(a=45, v=[1,0,0]) cylinder(r=3.5, h=30);
