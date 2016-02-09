package ui;

import ash.core.Entity;

import openfl.events.MouseEvent;

class Button extends UserInterface {

  public function new(_x: Int, _y: Int, _width: Int, _height: Int) {
    super();
    width = _width;
    height = _height;
    x = _x;
    y = _y;
  }

  public function update() {
    /*var pressed_t = Input.mouse[Input.MouseButtons.left];
    var mx: Int = Input.mouseX,
        my: Int = Input.mouseY;
    var in_range:Bool = mx > x && mx < (x + width) &&
                        my > y && my < (y + width);
    if ( !pressed && pressed_t && in_range ) // start click on button
      pressed = true;
    if ( pressed && !pressed_t && in_range ) // finish click on button
      activate_button();
    if ( !pressed_t ) // no longer clicking on button, note above will fall
      pressed = false; // into this so order of if-statements matter.*/

  }
  
  public private function activate_button() {
    // send Activate signal
    // how?
  }
  
}
