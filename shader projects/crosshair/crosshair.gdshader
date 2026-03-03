shader_type canvas_item;

uniform float center_size: hint_range(0.0, 1.0) = 0.5;
uniform float circle_width: hint_range(0.0, 1.0) = 0.5;
uniform float circle_distance: hint_range(0.0, 1.0) = 0.5;
uniform float bar_cutout: hint_range(0.0, 1.0) = 0.2;


float create_circles(vec2 uv) {
	
	float circle = step(distance(uv, vec2(0.5,0.5)), center_size/10.0);
	float outer_circle = step(distance(uv, vec2(0.5,0.5)), circle_distance);
	float inner_circle = step(distance(uv, vec2(0.5,0.5)), circle_distance - circle_width);
	
	float bar_h = step(distance(uv.y, 0.5), bar_cutout);
	float bar_v = step(distance(uv.x, 0.5), bar_cutout);
	
	float cross = bar_h + bar_v;
	return circle + max(outer_circle - inner_circle - cross, 0);
}

float create_lines(vec2 uv) {
	return 1.;
}

void fragment() {
	COLOR.rgb = vec3(1);
	COLOR.a = create_circles(UV);
}