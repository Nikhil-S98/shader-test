shader_type canvas_item;

uniform sampler2D scale_curve;

void vertex() {
	//VERTEX.x += sin(TIME);
	float normalized_curve = 0.5 * (1. + sin(TIME));
	float curve_forward = fract(TIME/2.);
	float curve_output = .1 + texture(scale_curve, vec2(curve_forward, 0.)).r;
	VERTEX *= curve_output * 5.;
}

void fragment() {
COLOR.rgb = texture(scale_curve, UV).rgb + vec3(0.2, 0.3, 0.7);
}