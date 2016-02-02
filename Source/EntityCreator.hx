package EntityCreator {
  import ash.core.Entity;
  class EntityCreator {
    private var engineRef : Engine;
    public function EntityCreator(_engine:Engine) {
      engineRef = _engine;
    }

    public function Create_Player():Entity {
      var player : Entity = new Entity(Entities.PLAYER);
      player.add(new Array(
        new Renderable( ... ),
        new PlayerControls(),
        new Actor,
        new CameraFocus,
        new Health,
        new Inventory
      );
      return player;
    }

    public function Create_Mob(type:Mob::Type) : Entity {
      switch ( type ) {
        case Mob::Type::Enemy:

        break;
      }
    }


    // -- private typedefs
    private typedef MobDefinition = {
      var amount : Int;
      var power : Int;
      var defense : Int;
    }
  };
};
