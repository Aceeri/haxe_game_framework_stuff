package components;

class AI {
  private var _sight_radius: Int;
  private var _sight_direction: Vector;
  private var _last_known_enemy_position: Vector;

  public function new(_sight_radius:Int) {
    Sightradius = _sight_radius;
    sightDirection = {x: 0, y: 0};
  }

  public inline function set_last_known_enemy_position(x: Int, y: Int) {
    if (_last_known_enemy_position == null )
      _last_known_enemy_position = {x: x, y: y};
  }

  public inline function clear_last_known_enemy_position(): Void {
    _last_known_enemy_position = null;
  }


  public inline function set_sight_direction(x: Int, y: Int) {
    _sight_direction = {x: x, y: y};
    Vector2.normalize(_sight_direction);
  }
};
