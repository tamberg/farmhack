// CC BY-SA 4.0, @tamberg

$fn = 144;

module base() {
  difference() {
    union() {
      translate([13 + 1, 13 + 1, 0]) cylinder(1, 26 + 2, 26 + 2);
      translate([0, 0, 1]) cube([24 + 4, 25 + 4, 2]);
    }
    translate([2, 2, -0.01]) cube([24 + 2.01, 25, 3.02]);
  }
}

module ring() {
  difference() {
    union() {
      cylinder(1, 26 + 2, 26 + 2);
      translate([0, 0, 2]) cylinder(1, 26.5, 26.5);
      translate([0, 0, 2]) sphere(26);
    }
    translate([0, 0, 3]) sphere(25);
    translate([-26, -26, 8]) cube([52, 52, 26]);
    translate([-26, -26, -26]) cube([52, 52, 26]);
  }
}

translate([0, 0, 10]) ring();
translate([-13 - 1, -13 - 1, 0]) base();