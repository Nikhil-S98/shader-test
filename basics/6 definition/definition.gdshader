shader_type canvas_item;

void vertex() {
	VERTEX += vec2((cos(TIME*2.0) * 10.0 + 10.0),0.0) * step(0.5, UV.y);
}

void fragment() {
	float y_pos = step(0.5, UV.y);
	COLOR.rgb = vec3(y_pos);
}