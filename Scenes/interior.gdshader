// pixelate.gdshader
shader_type canvas_item;
uniform float block_size : hint_range(1.0, 128.0) = 1.0;
uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;

void fragment() {
    vec2 vp = 1.0 / SCREEN_PIXEL_SIZE;
    vec2 snapped = floor(SCREEN_UV * vp / block_size) * block_size / vp;
    COLOR = texture(screen_texture, snapped);
}
