shader_type canvas_item;

uniform int pixel_size: hint_range(0, 64) = 20;

void fragment() {
	vec2 texture_size_px = 1.0 / TEXTURE_PIXEL_SIZE;
	vec2 grid_dimension = texture_size_px / float(pixel_size);
	vec2 pixel_uv = floor((UV * grid_dimension) + 0.5) / grid_dimension;
	COLOR = texture(TEXTURE, pixel_uv);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
