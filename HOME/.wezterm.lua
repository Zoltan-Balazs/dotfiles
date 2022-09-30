local wezterm = require 'wezterm'

return {
    -- color_scheme = 'OneDark (base16)',
    color_scheme = "Brogrammer",
    font = wezterm.font 'Iosevka SS14 Extended',
    font_size = 12.0,
    tab_bar_at_bottom = false,
    default_cursor_style = 'BlinkingBar',
    -- cursor_blink_ease_in = 'Constant',
    -- cursor_blink_ease_out = 'Constant',
    max_fps = 30,
    animation_fps = 1,
    --enable_scroll_bar = false,
    --enable_tab_bar = false,
    --enable_wayland = true,
    --enable_wayland_hi_dpi = true,
    --enable_wayland_window_decorations = true,
    --enable_wayland_window_frame = true,
    -- enable_wayland = true,
    initial_cols = 100,
    initial_rows = 30,
}
