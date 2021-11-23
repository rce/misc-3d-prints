$fn = 100;

height = 9.5;

inner_radius = 12.3 / 2;
inner_thickness = (12.3 - 7.4) / 2.0;
inner_height = height;


outer_radius = 59.2 / 2;
outer_height = 2.3;
outer_lesser_radius = 57.5 / 2;
outer_lesser_height = height;
outer_thickness = inner_thickness;

difference() {

    union() {
        difference() {
            union() {
                cylinder(r = outer_radius, h = outer_height);
                cylinder(r = outer_lesser_radius, h = outer_lesser_height);
            }

            translate([0, 0, 2]) cylinder(r = outer_lesser_radius - outer_thickness, h = outer_lesser_height);
        }
        union() {
            cylinder(r = inner_radius, h = inner_height);
            cylinder(r = inner_radius, h = inner_height);
        }
    }
    translate([0, 0, -1]) cylinder(r = inner_radius - inner_thickness, h = 100);
}