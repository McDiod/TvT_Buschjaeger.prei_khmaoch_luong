#include "..\baseDefines.hpp"
#include "..\ui_toolkit.hpp"
#include "defines.hpp"

class uo_RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {0.4, 0.4, 0.4, 1};
	colorBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		0.7
	};
	colorBackgroundDisabled[] = {0.95, 0.95, 0.95, 1};
	colorBackgroundActive[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorFocused[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	colorShadow[] = {0, 0, 0, 1};
	colorBorder[] = {0, 0, 0, 1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class uo_RscConfirmHintTitle
{
	idc = -1;
	access = 0;
	type = CT_STATIC;
	style = ST_LEFT;
	font = "PuristaLight";
	sizeEx = 0.04 * TEXT_SCALE;
	moving = 1;
	colorText[] = {1, 1, 1, 1};
	text = "";
	fixedWidth = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	linespacing = 1;
	x = 0;
	y = 0;
	w = uo_ch_W;
	h = uo_ch_H;
	colorBackground[] = {0,0,0,0.8};
};

class uo_RscConfirmHintButton: uo_RscButton
{
	idc = -1;
	style = ST_LEFT;
	shadow = 0;
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundActive[] = {1,1,1,0.8}; // hover
	colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
	colorBackgroundFocused[] = {0,0,0,0.5};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	font = "PuristaLight";
	sizeEx = 0.03;
	colorBackground[] = {0,0,0,0.6};
	w = uo_ch_W;
	h = uo_ch_H;
};

class uo_confirmHint
{
	idd = uo_ch_DIALOG;
	movingenable = 1;

	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	onLoad = "player say 'defaultNotification'";

	class ControlsBackground
	{
		class HintTitle: uo_RscConfirmHintTitle
		{
			moving = 1;
			idc = uo_ch_TITLE;
			x = uo_ch_X;
			y = uo_CH_Y;
			text = "";
		};
	};

	class Controls {
		class ConfirmButton: uo_RscConfirmHintButton
		{
			idc = uo_ch_BUTTON;
			text = "OK";
			x = uo_ch_X;
			y = uo_CH_Y + 1.1*uo_ch_H;
			action = "closeDialog 0";
		};
	};
};
