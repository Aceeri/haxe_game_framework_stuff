package ui;

import ash.core.Entity;

import openfl.events.MouseEvent;

class Button extends UserInterface {
  // private:
  private var state: State;
  private static colour: Vector<int>;
  private static shapes: Vector<Shape>;

  // public:
  enum State {
      unhighlight;
      highlight;
      clicked;
  };

  private function activate_button() : Void;

  public function new() {
    // -- static init --
    if ( colour == null ) {
      colour = [0x5A607A, 0x506030, 0x500000];
      addEventListener(MouseEvent.CLICK,
    }
    // -- constructor --
    set_state(State.unhighlight);
    super();
  }

  public function set_state(s:State) : Void {
    state = s;

    graphics.clear();
    graphics.beginFill( colour[int(s)] );
    graphics.drawRect(0, 0, width, height);
    graphics.endFill();
  }

  public function ret_state() : State { return state; }

  public override function update(delta: Float) {
    super.update(delta);
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

  public function update_button(event:MouseEvent) {
    switch ( event.type ) {
      case "click":
        set_state(State.clicked);
        activate_button();
      break;
      case "mouseOut":
        set_state(State.unhighlight);
      break;
      case "mouseOver":
        set_state(State.highlight);
      break;
    }
  }
}