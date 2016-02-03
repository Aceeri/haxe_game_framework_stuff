package components;
import flash.events;
import ash.core.Entity;

class Button {
  public var pressed: Bool;
  public var width:int,
             height:int,
             x:int,
             y:int;

  public function new(_x:int, _y:int, _width:int, _height:int) {
    Width = _width;
    Height = _height;
    x = _x;
    y = _y;
  }

  public function Update() {
    pressed = KeyInput.mouse[KeyInput.MouseButtons.left];
    if ( !pressed ) return;
    var mx: Int = KeyInput.mouseX,
        my: Int = KeyInput.mouseY;
    pressed = mx > x && mx < (x+width) &&
              my > y && my < (y+width);
  }
};
