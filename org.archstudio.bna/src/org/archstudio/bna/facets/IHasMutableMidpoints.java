package org.archstudio.bna.facets;

import org.eclipse.jdt.annotation.NonNullByDefault;

/*
 * DO NOT EDIT THIS FILE, it is automatically generated. ANY MODIFICATIONS WILL BE OVERWRITTEN.
 *
 * To modify, update the thingdefinition extension at
 * org.archstudio.bna/Package[name=org.archstudio.bna.facets]/Facet[name=Midpoints].
 */

@SuppressWarnings("all")
@NonNullByDefault
public interface IHasMutableMidpoints extends IHasMidpoints {

  public static final String USER_MAY_ADD_MIDPOINTS = "UserMayAddMidpoints";

  public static final String USER_MAY_MOVE_MIDPOINTS = "UserMayMoveMidpoints";

  public static final String USER_MAY_REMOVE_MIDPOINTS = "UserMayRemoveMidpoints";

  public void setMidpoints(java.util.List<java.awt.geom.Point2D> midpoints);
}
