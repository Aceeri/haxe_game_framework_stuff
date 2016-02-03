package KeyInput {
  import openfl.Vector;

  class KeyInput {
    public static var keys: Vector<Bool>,
                      mouse: Vector<Bool>;
    public static var mouseX: Int,
                      mouseY: int;

    public enum MouseButtons {
      left, right, middle
    };

    public static function Initialize() {
      KeyInput.keys = new Vector<Bool>(200);
    }
  }
};
