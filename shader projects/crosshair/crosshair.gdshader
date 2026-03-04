shader_type canvas_item;

uniform float center_size: hint_range(0.0, 1.0) = 0.5;
uniform float circle_width: hint_range(0.0, 1.0) = 0.5;
uniform float circle_distance: hint_range(0.0, 1.0) = 0.5;
uniform float bar_cutout: hint_range(0.0, 1.0) = 0.2;

uniform float crosshair_distance: hint_range(0.0, 1.0, 0.1) = 0.25;
uniform float crosshair_length: hint_range(0.0, 0.2, 0.01) = 0.12;
uniform float crosshair_thickness: hint_range(0.0, 1.0, 0.01) = 0.05;

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
	vec2 center_distance = vec2(0.5) + crosshair_distance;
	float h_width = step(distance(uv.x, center_distance.x), crosshair_length) 
					+ step(distance(1. - uv.x, center_distance.x), crosshair_length);
	float h_height = step(distance(uv.y, 0.5) , crosshair_thickness * 0.25);
	float v_width = step(distance(uv.y, center_distance.y), crosshair_length) 
					+ step(distance(1. - uv.y, center_distance.y), crosshair_length);
	float v_height = step(distance(uv.x, 0.5) , crosshair_thickness * 0.25);
	return h_width * h_height + v_width * v_height;
}

void fragment() {
	COLOR.rgb = vec3(1);
	COLOR.a = create_circles(UV) + create_lines(UV);
}