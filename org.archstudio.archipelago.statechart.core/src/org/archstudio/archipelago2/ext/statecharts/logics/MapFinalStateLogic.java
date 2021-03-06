package org.archstudio.archipelago2.ext.statecharts.logics;

import java.awt.Dimension;
import java.util.List;

import org.archstudio.archipelago2.Archipelago2Preferences;
import org.archstudio.archipelago2.Archipelago2Utils;
import org.archstudio.archipelago2.ext.statecharts.things.FinalStateThing;
import org.archstudio.bna.IBNAWorld;
import org.archstudio.bna.facets.IHasColor;
import org.archstudio.bna.facets.IHasEdgeColor;
import org.archstudio.bna.facets.IHasMutableReferencePoint;
import org.archstudio.bna.facets.IHasMutableSelected;
import org.archstudio.bna.facets.IHasSecondaryColor;
import org.archstudio.bna.facets.IHasToolTip;
import org.archstudio.bna.keys.IThingRefKey;
import org.archstudio.bna.keys.ThingRefKey;
import org.archstudio.bna.logics.coordinating.MirrorBoundingBoxLogic;
import org.archstudio.bna.logics.coordinating.MirrorValueLogic;
import org.archstudio.bna.utils.Assemblies;
import org.archstudio.bna.utils.BNAPath;
import org.archstudio.bna.utils.BNAUtils;
import org.archstudio.bna.utils.BNAUtils2;
import org.archstudio.bna.utils.UserEditableUtils;
import org.archstudio.sysutils.Finally;
import org.archstudio.xadl.bna.facets.IHasXArchID;
import org.archstudio.xadl.bna.logics.mapping.AbstractXADLToBNAPathLogic;
import org.archstudio.xarchadt.IXArchADT;
import org.archstudio.xarchadt.ObjRef;
import org.eclipse.jdt.annotation.Nullable;
import org.eclipse.jface.util.IPropertyChangeListener;
import org.eclipse.jface.util.PropertyChangeEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.RGB;
import org.eclipse.swt.graphics.Rectangle;

import com.google.common.base.Function;

public class MapFinalStateLogic extends AbstractXADLToBNAPathLogic<FinalStateThing>
    implements IPropertyChangeListener {
  public static final IThingRefKey<IHasEdgeColor> CENTER_KEY =
      ThingRefKey.create("assembly-center");

  protected final MirrorValueLogic mirrorLogic;
  protected final MirrorBoundingBoxLogic boundsLogic;
  protected Dimension defaultSize = new Dimension(4 * 24 / 3, 4 * 24 / 3);

  public MapFinalStateLogic(IBNAWorld world, IXArchADT xarch, ObjRef rootObjRef, String objRefPath,
      String description) {
    super(world, xarch, rootObjRef, objRefPath);
    mirrorLogic = logics.addThingLogic(MirrorValueLogic.class);
    boundsLogic = logics.addThingLogic(MirrorBoundingBoxLogic.class);

    syncValue("id", null, null, BNAPath.create(), IHasXArchID.XARCH_ID_KEY, true);
    syncValue("name", null, "[no name]", BNAPath.create(), IHasToolTip.TOOL_TIP_KEY, true);
    setProgressInfo(description);

    Archipelago2Utils
        .weakListenToPropertyChanges(Archipelago2Preferences.getActivatorPreferenceStore(), this);
  }

  @Override
  protected FinalStateThing addThing(List<ObjRef> descendantRefs, ObjRef objRef) {
    Point location = BNAUtils2.getNewThingSpot(world, true);
    FinalStateThing thing = model.addThing(new FinalStateThing(null),
        Assemblies.getLayer(model, Assemblies.Layer.MIDDLE));
    thing.setBoundingBox(
        new Rectangle(location.x, location.y, defaultSize.width, defaultSize.height));
    thing.setColor(new RGB(32, 32, 32));
    Assemblies.markRoot(thing);

    mirrorLogic.mirrorValue(thing, IHasColor.COLOR_KEY, thing,
        IHasSecondaryColor.SECONDARY_COLOR_KEY, new Function<RGB, RGB>() {
          @Override
          @Nullable
          public RGB apply(@Nullable RGB input) {
            return BNAUtils.adjustBrightness(input, 2f);
          }
        });

    UserEditableUtils.addEditableQualities(thing, IHasMutableSelected.USER_MAY_SELECT,
        IHasMutableReferencePoint.USER_MAY_MOVE);
    return thing;
  }

  @Override
  public void applyDefaults(FinalStateThing thing) {
    super.applyDefaults(thing);
    applyPreferences(thing);
  }

  @Override
  public void propertyChange(PropertyChangeEvent event) {
    try (Finally lock = BNAUtils.lock()) {
      for (FinalStateThing thing : getAddedThings()) {
        applyPreferences(thing);
      }
    }
  }

  public void applyPreferences(FinalStateThing thing) {
    thing.setLineWidth(1 + Archipelago2Preferences.getLineWidth());
  }
}
