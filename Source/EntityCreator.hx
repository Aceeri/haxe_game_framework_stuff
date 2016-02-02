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
      engine.addEntity(player);
      return player;
    }

    public function Create_Mob() : Entity {
      var mobDef : MobDefinition = mobDefs.R_Choice();
      var mob : Entity = new Entity();
      mob.add(new Array(
        new Renderable( ... ),
        new Position(),
        new Actor,
        new Statistics(mobDef.health, mobDef.strength));
      mob.add(new Inventory(mobDef.inventory));
      switch ( mobDefs.AI_Type ) {
        case Mob::Type::Zombie:
          mob.add(new ZombieAI());
        break;
        case Mob::Type::Human:
          mob.add(new HumanAI());
        break;
      }
      engine.addEntity(mob);
      return mob;
    }


    // -- private typedefs
    private typedef MobDefinition = {
      var amount : Int;
      var power : Int;
      var defense : Int;
    }
  };
};
