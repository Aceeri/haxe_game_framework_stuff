package KeyInput {
  import openfl.Vector;

  class KeyInput {
    public static var keys: Vector<Bool>;

    public static function initialize() {
      KeyInput.keys = new Vector<Bool>(200);
    }
  }
};