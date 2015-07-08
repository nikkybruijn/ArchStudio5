package org.archstudio.bna.facets;

import org.archstudio.bna.keys.IThingKey;
import org.archstudio.bna.keys.ThingKey;
import org.archstudio.bna.logics.background.RotatingOffsetLogic;
import org.archstudio.bna.things.borders.MarqueeBoxBorderThing;
import org.archstudio.bna.things.shapes.RectangleThing;
import org.eclipse.jdt.annotation.NonNullByDefault;

/*
 * DO NOT EDIT THIS FILE, it is automatically generated. ANY MODIFICATIONS WILL BE OVERWRITTEN.
 *
 * To modify, update the thingdefinition extension at
 * org.archstudio.bna/Package[name=org.archstudio.bna.facets]/Facet[name=RotatingOffset].
 */

@SuppressWarnings("all")
@NonNullByDefault
public interface IHasRotatingOffset extends org.archstudio.bna.IThing {

  /**
   * This is an optimization to reduce unnecessary BNA event noise caused by the
   * {@link RotatingOffsetLogic} calling {@link #incrementRotatingOffset()}. For example, it is
   * unnecessary to call {@link #incrementRotatingOffset()} for things that are not selected, e.g.,
   * {@link RectangleThing}. Conversely, {@link #incrementRotatingOffset()} must always be called on
   * {@link MarqueeBoxBorderThing}.
   * 
   * @see RotatingOffsetLogic
   * @see MarqueeBoxBorderThing
   * @return <code>false</code> if it is know that calling the {@link #incrementRotatingOffset()}
   *         method is unnecessary, <code>true</code> otherwise.
   */
  public boolean shouldIncrementRotatingOffset();

  public static final IThingKey<java.lang.Integer> ROTATING_OFFSET_KEY = ThingKey.create(
      com.google.common.collect.Lists.newArrayList("rotatingOffset", IHasRotatingOffset.class));

  public int getRotatingOffset();
}
