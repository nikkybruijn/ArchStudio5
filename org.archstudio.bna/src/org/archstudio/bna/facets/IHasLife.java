package org.archstudio.bna.facets;

import org.archstudio.bna.keys.IThingKey;
import org.archstudio.bna.keys.ThingKey;
import org.eclipse.jdt.annotation.NonNullByDefault;

/*
 * DO NOT EDIT THIS FILE, it is automatically generated. ANY MODIFICATIONS WILL BE OVERWRITTEN.
 *
 * To modify, update the thingdefinition extension at
 * org.archstudio.bna/Package[name=org.archstudio.bna.facets]/Facet[name=Life].
 */

@SuppressWarnings("all")
@NonNullByDefault
public interface IHasLife extends org.archstudio.bna.IThing {
  public static final IThingKey<java.lang.Integer> LIFE_KEY =
      ThingKey.create(com.google.common.collect.Lists.newArrayList("life", IHasLife.class));

  public int getLife();
}
