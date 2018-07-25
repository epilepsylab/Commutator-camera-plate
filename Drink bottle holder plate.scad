// Drink bottle holder
$fn = 180;

difference(){
    translate ([75, -25, -15]) cube ([35, 50, 30], center = false);
    union() {
        cylinder (50, d = 203, center = true);
        translate ([0,-20,0]) rotate ([0,90,0]) cylinder (300, d = 3, center = false);
        translate ([0,20,0]) rotate ([0,90,0]) cylinder (300, d = 3, center = false);
    } 
}