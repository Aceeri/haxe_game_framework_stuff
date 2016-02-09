package components;
import flash.events;
import ash.core.Entity;

class Button {
  public var pressed: Bool;
  public var width: Int,
             height: Int,
             x: Int,
             y: Int;

  public function new(_x: Int, _y: Int, _width: Int, _height: Int) {
    width = _width;
    height = _height;
    x = _x;
    y = _y;
  }

  public function update() {
    pressed = Input.mouse[Input.MouseButtons.left];
    if (!pressed) return;
    var mx: Int = Input.mouseX,
        my: Int = Input.mouseY;
    pressed = mx > x && mx < (x + width) &&
              my > y && my < (y + width);
  }
};
