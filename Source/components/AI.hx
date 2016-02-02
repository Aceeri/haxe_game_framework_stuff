package components;

class AI {
  private var Sightradius: Int;
  private var sightDirection: Vector;
  private var lastKnownEnemyPosition: Vector;

  public function new(_sightRadius:Int) {
    Sightradius = _sightRadius;
    sightDirection = {x: 0, y: 0};
  }

  public inline function setLastKnownEnemyPosition(x:Int, y:Int) {
    if ( lastKnownEnemyPosition == null )
      lastKnownEnemyPosition = {x: x, y: y};
  }

  public inline function clearLastKnownEnemyPosition(): void {
    lastKnownEnemyPosition = null;
  }


  public inline function setSightDirection(x:Int, y:Int) {
    sightDirection = {x: x, y: y};
    Vector.Normalize(sightDirection);
  }
};
