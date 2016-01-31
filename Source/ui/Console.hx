package ui;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.events.MouseEvent;

class Console extends UserInterface {
  public var lines: Array<TextField>;
  public var max_lines = 500;
  public var format: TextFormat;
  public var scroll: Float;
  private var speed: Float;
  private var bounds: Float;

  public function new() {
    super();
    lines = [];

    format = new TextFormat();
    format.size = 15;

    size.x = 350;
    size.y = 150;
    background_color = 0x0F0F0F;
    background_alpha = 0.5;
    scroll = 0.0;
    speed = 7.0;
    bounds = 3.0;

    visible = false;

    addEventListener(MouseEvent.MOUSE_WHEEL, wheel);
  }

  public function log(msg: String):Void {
    var match = false;

    var r = ~/\(?(\d+)?\)?\s?(.+)/g;
    if (lines[0] != null) {
      r.match(lines[0].text);
      var count = 1;
      if (r.matched(1) != null) {
        count = Std.parseInt(r.matched(1));
      }

      if (r.matched(2) == msg) {
        lines[0].text = "(" + (count + 1) + ") " + msg;
        match = true;
      }
    }

    if (!match) {
      var new_line = new TextField();
      new_line.textColor = 0xF0F0F0;
      new_line.width = size.x;
      new_line.text = msg;
      new_line.setTextFormat(format);
      addChild(new_line);
      lines.insert(0, new_line);

      if (lines.length > max_lines) {
        removeChild(lines.pop());
      }
    }

    update(0);
  }

  public override function update(delta: Float) {
    super.update(delta);

    for (index in 0...lines.length) {
      lines[index].y = (-format.size*index) + size.y - format.size - bounds + scroll;
    }
  }

  private function wheel(event: MouseEvent) {
    scroll += speed * event.delta;

    if (scroll < 0.0) {
      scroll = 0.0;
    } else if (scroll > lines.length * format.size + bounds - size.y) {
      scroll = lines.length * format.size + bounds - size.y;
    }
  }
}