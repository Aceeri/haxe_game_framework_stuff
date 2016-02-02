package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Matrix;

public class ButtonView extends Image {
  public function ButtonView(width:int, height:int) {
    var shape : Shape = new Shape();
    shape.graphics.beginFill( 0x5A607A );
    shape.graphics.drawRect (0, 0, width, height);
    shape.graphics.endFill();

    var bitmapData : flash.display.BitmapData = new BitmapData(4,4, true, 0);
    var transform : flash.geom.Matrix = new Matrix();
    transform.tx = width/2;
    transform.ty = height/2;
    bitmapData.draw( shape, transform, null, null, null, true );

    var texture : Texture =
      Texture.fromBitmapData( bitmapData, false, false, 1 );
    super ( texture );
    pivotX = width/2;
    pivotY = height/2;
  };
};