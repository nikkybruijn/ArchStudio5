package org.archstudio.bna.things.utility;

import org.archstudio.bna.IBNAWorld;
import org.archstudio.bna.utils.BNAUtils;
import org.eclipse.jdt.annotation.NonNullByDefault;
import org.eclipse.swt.graphics.RGB;

@NonNullByDefault
public class GridThing extends GridThingBase {

	public static GridThing createIn(IBNAWorld world) {
		BNAUtils.checkLock();

		GridThing thing = getIn(world);
		if (thing == null) {
			thing = world.getBNAModel().addThing(new GridThing());
		}
		return thing;
	}

	public static GridThing getIn(IBNAWorld world) {
		BNAUtils.checkLock();

		return (GridThing) world.getBNAModel().getThing(GridThing.class);
	}

	protected GridThing() {
		super(GridThing.class);
	}

	@Override
	protected void initProperties() {
		super.initProperties();
		setEdgeColor(new RGB(192, 192, 192));
	}

}
