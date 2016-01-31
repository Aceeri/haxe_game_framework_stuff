package ui;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.events.MouseEvent;

class UserInterface extends Sprite {
  private var shape: Shape;
  public var background_color: Int;
  public var background_alpha: Float;
  public var size: Point;
  public var resizable: Bool;

  public function new() {
    super();

    background_color = 0xFFFFFF;
    background_alpha = 1.0;
    size = new Point(100, 100);
    resizable = false;

    shape = new Shape();
    addChild(shape);
  }

  public function update(delta: Float) {
    scrollRect = new Rectangle(0, 0, size.x, size.y);
    shape.graphics.clear();
    shape.graphics.beginFill(background_color, background_alpha);
    shape.graphics.drawRect(0, 0, size.x, size.y);
    shape.graphics.endFill();
  }
}