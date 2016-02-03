package utils;

import ash.core.Entity;
import components.Description;

class EntityUtil {
  public static inline function R_Name(entity:Entity) : String {
    var desc: Name = entity.get(Description);
    if ( desc != null ) return desc.name;
    else                return "unknown entity";
  }
};
