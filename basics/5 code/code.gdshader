shader_type canvas_item;
uniform vec2 distance_eraser;

uniform sampler2D test_texture;

void fragment() {
	float vanisher = distance(UV, distance_eraser);
	COLOR.a = step(vanisher, 1.25 + (0.75 * sin(TIME * 3.0)));
	
	vec4 test = texture(test_texture, UV);
	COLOR.rgb = test.xyz;
}