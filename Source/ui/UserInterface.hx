package ui;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.events.MouseEvent;

class UserInterface extends Sprite {
	private var shape: Shape;
	public var backgroundColor: Int;
	public var backgroundAlpha: Float;
	public var size: Point;
	public var resizable: Bool;

	public function new() {
		super();

		backgroundColor = 0xFFFFFF;
		backgroundAlpha = 1.0;
		size = new Point(100, 100);
		resizable = false;

		shape = new Shape();
		addChild(shape);
	}

	public function update(delta: Float) {
		scrollRect = new Rectangle(0, 0, size.x, size.y);
		shape.graphics.clear();
		shape.graphics.beginFill(backgroundColor, backgroundAlpha);
		shape.graphics.drawRect(0, 0, size.x, size.y);
		shape.graphics.endFill();
	}
}