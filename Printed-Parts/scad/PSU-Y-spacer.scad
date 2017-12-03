// PRUSA iteration3
// PSU-Y reinforcement part 
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module base()
{
//union(){
    difference(){
        union(){
        translate([ 5, -23, 0 ]) cube([ 27, 38, 25 ]);  // horizontal plate
        //translate([ -23, -2, 0 ]) cube([ 28, 17, 28 ]);  // Y_Corner block    
        }
        translate( [ 4 , -25 , -1 ] ) cube( [ 9 , 41, 28 ] );  //  holder side cut
    }
    //difference(){    
    //    translate([ 8, -7, 0 ]) cube([ 5, 5, 15 ]);  // fillet block
    //    translate([ 8, -7, -1 ]) cylinder( h = 28, r = 5, $fn=30);  // fillet cut
    //    }
    //}
}


module cutout()
    {
    translate([ 23, 4 , -2 ]) cylinder( h = 36, r = 2.2, $fn=30);  // M3 hole A
    translate([ 23, -16 , -2 ]) cylinder( h = 36, r = 2.2, $fn=30);  // M3 hole B

    //vertical corners 45 degree cut
    translate([ 12,  9, -2 ])  rotate( [0,0,45] ) cube([ 10, 10, 36 ]);  
    translate([ 12, -31 , -2 ] ) rotate( [0,0,45] ) cube([ 10 , 10 , 36 ]);  
    translate([ 33,  9, -2 ])  rotate( [0,0,45] ) cube([ 10, 10, 36 ]);  
    translate([ 33, -31, -2 ]) rotate( [0,0,45] ) cube([ 10, 10, 36 ]);  
}

module final_part(){
difference()
{
    base();
    cutout();
    }
}

final_part();