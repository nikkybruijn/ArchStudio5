package org.archstudio.bna.things.glass;

import java.awt.Shape;

import org.archstudio.bna.IBNAView;
import org.archstudio.bna.ICoordinateMapper;
import org.archstudio.bna.things.AbstractCurvedSplineThingPeer;
import org.archstudio.bna.ui.IUIResources;
import org.archstudio.bna.utils.BNAUtils;
import org.eclipse.swt.graphics.Rectangle;

public class CurvedSplineGlassThingPeer<T extends CurvedSplineGlassThing> extends AbstractCurvedSplineThingPeer<T> {

	public CurvedSplineGlassThingPeer(T thing, IBNAView view, ICoordinateMapper cm) {
		super(thing, view, cm);
	}

	@Override
	public boolean draw(Rectangle localBounds, IUIResources r) {
		Rectangle lbb = BNAUtils.getLocalBoundingBox(cm, t);
		if (!lbb.intersects(localBounds) || !t.isSelected()) {
			return false;
		}

		Shape localShape = createLocalShape();

		r.selectShape(localShape, t.getRotatingOffset());

		return true;
	}

}