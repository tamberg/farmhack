// CC BY-SA 4.0, @tamberg

$fn = 36;

d = 3;

wx_ziptie = 1.5;
wy_ziptie = 5;

wx_eyelet = wx_ziptie + 2 * d;
wy_eyelet = wy_ziptie + 2 * d;

module ziptie(h) {
  cube([wx_ziptie, wy_ziptie, h + 0.02]);
}

module eyelet(h) {
  difference() {
    cube([wx_eyelet, wy_eyelet, h]);
    translate([(wx_eyelet - wx_ziptie) / 2, (wy_eyelet - wy_ziptie) / 2, -0.01]) ziptie(h);
  }
}

module crown(ro, ri, h) {
  difference() {
    union() {
      cylinder(h, ro, ro);
      translate([ri, -wy_eyelet / 2, 0]) eyelet(d);
      rotate([0, 0, 120]) translate([ri, -wy_eyelet / 2, 0]) eyelet(d);
      rotate([0, 0, 2 * 120]) translate([ri, -wy_eyelet / 2, 0]) eyelet(d);
    }
    translate([0, 0, -0.01]) cylinder(h + 0.02, ri, ri);
  }
}

module clamp(h, w, r, a) {
  rotate([0, 0, (360 - a)/2]) {
    rotate_extrude(angle=a)
    translate([r, 0, 0])
    square([w, h]);
    translate([cos(0) * (r + w/2), sin(0) * (r + w/2), 0]) cylinder(h, w/2, w/2);
    translate([cos(a) * (r + w/2), sin(a) * (r + w/2), 0]) cylinder(h, w/2, w/2);
  }
}

module collar(h, w, r) {
  union() {
//    translate([0, 0, 0]) clamp(h, w, r, 260);  
    translate([0, 0, 0]) clamp(h, w, r, 340);
    rotate([0, 0, 60]) translate([r + 1, -wy_eyelet / 2, 0]) eyelet(3);
    rotate([0, 0, 180]) translate([r + 1, -wy_eyelet / 2, 0]) eyelet(3);
    rotate([0, 0, 300]) translate([r + 1, -wy_eyelet / 2, 0]) eyelet(3);
  }
}

module cover(ro, ri, h) {
  difference() {
    union() {
      cylinder(h, ro + d, ro + d);
      translate([0, 0, 1]) cylinder(16, ri, ri);
    }
//#    translate([ri - (wx_ziptie + 2 * d)), 0]) ziptie(16);
  }
}

//translate([0, 0, 60]) rotate([0, 0, 60]) crown(15 + d, 15, d);
//collar(2, 3, 78/2);
//collar(3, 3, 78/2);

crown(15 + d, 15, d);

//cover(81, 70, d);