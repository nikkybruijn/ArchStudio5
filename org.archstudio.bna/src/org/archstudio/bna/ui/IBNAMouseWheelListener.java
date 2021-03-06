package org.archstudio.bna.ui;

import java.util.List;

import org.archstudio.bna.IBNAView;
import org.archstudio.bna.ICoordinate;
import org.archstudio.bna.IThing;
import org.archstudio.bna.constants.MouseType;
import org.eclipse.swt.events.MouseEvent;

/**
 * @deprecated Use {@link IBNAMouseWheelListener2}.
 */
@Deprecated
public interface IBNAMouseWheelListener {

	public void mouseVerticalWheel(IBNAView view, MouseType type, MouseEvent e, List<IThing> t, ICoordinate location);

	public void mouseHorizontalWheel(IBNAView view, MouseType type, MouseEvent e, List<IThing> t, ICoordinate location);

}
