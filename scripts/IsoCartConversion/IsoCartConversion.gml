// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function IsoCartConversion(){
	
	cart_x = x;
	cart_y = y;
	
	iso_x = (cart_x-cart_y)+global.xOffset;
	iso_y = ((cart_x+cart_y)/2)+(global.yOffset-z);

	if global.isoView = false
	{
	    draw_x = cart_x;
	    draw_y = cart_y;
	}
	if global.isoView = true
	{
	    draw_x = iso_x;
	    draw_y = iso_y;
	}
}