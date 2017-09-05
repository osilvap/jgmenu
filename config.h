#ifndef CONFIG_H
#define CONFIG_H

#include "align.h"

struct config {
	int spawn;		/* 1:execute commands  0:print to stdout */
	int stay_alive;
	int hide_on_startup;
	/* jgmenurc has a csv_cmd variable here */
	int tint2_look;
	int tint2_button;
	int tint2_rules;
	int at_pointer;
	int multi_window;
	char *terminal_exec;
	char *terminal_args;

	int menu_margin_x;
	int menu_margin_y;
	int menu_width;
	int menu_padding_top;
	int menu_padding_right;
	int menu_padding_bottom;
	int menu_padding_left;
	int menu_radius;
	int menu_border;
	enum alignment menu_halign;
	enum alignment menu_valign;

	int sub_spacing;
	int sub_padding_top;
	int sub_padding_right;
	int sub_padding_bottom;
	int sub_padding_left;

	int item_margin_x;
	int item_margin_y;
	int item_height;	/* set to font height if greater */
	int item_padding_x;
	int item_radius;
	int item_border;
	enum alignment item_halign;
	int sep_height;

	char *font;
	char *font_fallback;
	int icon_size;		/* if set to zero, icons won't show */
	int icon_text_spacing;
	char *icon_theme;
	char *icon_theme_fallback;

	char *arrow_string;
	int arrow_width;

	double color_menu_bg[4];
	double color_menu_fg[4];
	double color_menu_border[4];
	double color_norm_bg[4];
	double color_norm_fg[4];
	double color_sel_bg[4];
	double color_sel_fg[4];
	double color_sel_border[4];
	double color_sep_fg[4];
};

extern struct config config;

void config_set_defaults(void);
void config_cleanup(void);
void config_parse_file(char *filename);

#endif /* CONFIG_H */
