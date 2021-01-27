$fn = 100;

pipe_inner_radius = 17 / 2;
pipe_outer_radius = 19 / 2;

height = 22;
base_height = 6;
top_height = height - base_height;

base_radius = pipe_outer_radius;
top_radius = 13 / 2;
top_inner_radius = 11.5 / 2;


// base
cylinder(r=base_radius, h=base_height);

// top
translate([0, 0, base_height]) {
    difference() {
        union() {
            // insert
            cylinder(r=top_radius, h=top_height);

            num_rings = 2;
            ring_height = top_height / (num_rings + 0.5);
            ring_radius = pipe_inner_radius + 0.5;
            for (i = [1  : num_rings]) {
                translate([0, 0, top_height - (ring_height * i)]) {
                  cylinder(r1 = ring_radius, r2 = 0, h = ring_height + 4);
                }
            }
        }

        // + 10 to make sure the top is open
        cylinder(r=top_inner_radius, h=top_height + 10);
    }
}