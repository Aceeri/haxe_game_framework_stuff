package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Matrix;

public class ButtonView extends Image {
  enum State {
    unhighlight:Int = 0;
    highlight  :Int = 1;
    clicked    :Int = 2;
  }
  private var unhighlight : Shape,
              highlight   : Shape,
              clicked     : Shape;
  private var state       : State;
  private static colour : Vector<Int>;

  public function new(width:int, height:int) {
    // -- static inits --
    if ( colour == null ) {
      colour = [0x5A607A, 0x506030, 0x500000];
    }
    // -- constructor --
    for ( var i : int = 0; i != 3; ++ i ) {
      var shape : Shape = new Shape();
      shape.graphics.beginFill( colour[i] );
      shape.graphics.drawRect (0, 0, width, height);
      shape.graphics.endFill();
      switch ( i ) {
        case 0: unhighlight = shape; break;
        case 1: highlight   = shape; break;
        case 2: clicked     = shape; break;
      }
    }

    setDefault();
 
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


  public function setState(s:State) : Void {
    state = s;
    // ... TODO ...
  }
  public function rState() : State { return state; }
};
