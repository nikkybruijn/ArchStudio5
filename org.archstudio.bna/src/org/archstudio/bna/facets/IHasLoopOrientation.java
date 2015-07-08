package org.archstudio.bna.facets;

import org.archstudio.bna.keys.IThingKey;
import org.archstudio.bna.keys.ThingKey;
import org.eclipse.jdt.annotation.NonNullByDefault;

/*
 * DO NOT EDIT THIS FILE, it is automatically generated. ANY MODIFICATIONS WILL BE OVERWRITTEN.
 *
 * To modify, update the thingdefinition extension at
 * org.archstudio.bna/Package[name=org.archstudio.bna.facets]/Facet[name=LoopOrientation].
 */

@SuppressWarnings("all")
@NonNullByDefault
public interface IHasLoopOrientation extends org.archstudio.bna.IThing {
  public static final IThingKey<org.archstudio.swtutils.constants.Orientation> LOOP_ORIENTATION_KEY =
      ThingKey.create(com.google.common.collect.Lists.newArrayList("loopOrientation",
          IHasLoopOrientation.class));

  public org.archstudio.swtutils.constants.Orientation getLoopOrientation();
}
