package org.archstudio.bna.logics.editing;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.archstudio.bna.IBNAView;
import org.archstudio.bna.IBNAWorld;
import org.archstudio.bna.ICoordinate;
import org.archstudio.bna.IThing;
import org.archstudio.bna.facets.IHasMutableAnchorPoint;
import org.archstudio.bna.facets.IHasMutableBoundingBox;
import org.archstudio.bna.logics.AbstractThingLogic;
import org.archstudio.bna.logics.coordinating.StickPointLogic;
import org.archstudio.bna.ui.IBNAMenuListener2;
import org.archstudio.bna.utils.BNAAction;
import org.archstudio.bna.utils.BNAAlignUtils;
import org.archstudio.bna.utils.BNADistributeUtils;
import org.archstudio.bna.utils.BNAUtils;
import org.archstudio.bna.utils.BNAUtils2.ThingsAtLocation;
import org.archstudio.swtutils.constants.HorizontalAlignment;
import org.archstudio.swtutils.constants.VerticalAlignment;
import org.eclipse.jface.action.IMenuManager;
import org.eclipse.jface.action.MenuManager;
import org.eclipse.jface.resource.ImageRegistry;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.widgets.Display;

import com.google.common.collect.Collections2;
import com.google.common.collect.Lists;

public class AlignAndDistributeLogic extends AbstractThingLogic implements IBNAMenuListener2 {
	protected ImageRegistry imageRegistry = null;

	protected static final String ALIGN_LEFT = "alignLeft";
	protected static final String ALIGN_CENTER = "alignCenter";
	protected static final String ALIGN_RIGHT = "alignRight";
	protected static final String ALIGN_TOP = "alignTop";
	protected static final String ALIGN_MIDDLE = "alignMiddle";
	protected static final String ALIGN_BOTTOM = "alignBottom";

	protected static final String DISTRIBUTE_HORIZONTAL_LOOSE = "distributeHorizontalLoose";
	protected static final String DISTRIBUTE_HORIZONTAL_TIGHT = "distributeHorizontalTight";
	protected static final String DISTRIBUTE_VERTICAL_LOOSE = "distributeVerticalLoose";
	protected static final String DISTRIBUTE_VERTICAL_TIGHT = "distributeVerticalTight";

	final StickPointLogic stickLogic;

	public AlignAndDistributeLogic(IBNAWorld world) {
		super(world);
		stickLogic = logics.getThingLogic(StickPointLogic.class);
	}

	protected void loadImages(IBNAView view) {
		Display disp = view.getBNAUI().getComposite().getDisplay();
		imageRegistry = new ImageRegistry(disp);

		imageRegistry.put(ALIGN_LEFT, new Image(disp, getClass().getResourceAsStream("res/align-left.gif")));
		imageRegistry.put(ALIGN_CENTER, new Image(disp, getClass().getResourceAsStream("res/align-center.gif")));
		imageRegistry.put(ALIGN_RIGHT, new Image(disp, getClass().getResourceAsStream("res/align-right.gif")));
		imageRegistry.put(ALIGN_TOP, new Image(disp, getClass().getResourceAsStream("res/align-top.gif")));
		imageRegistry.put(ALIGN_MIDDLE, new Image(disp, getClass().getResourceAsStream("res/align-middle.gif")));
		imageRegistry.put(ALIGN_BOTTOM, new Image(disp, getClass().getResourceAsStream("res/align-bottom.gif")));

		imageRegistry.put(DISTRIBUTE_HORIZONTAL_LOOSE,
				new Image(disp, getClass().getResourceAsStream("res/distribute-horizontal-loose.gif")));
		imageRegistry.put(DISTRIBUTE_HORIZONTAL_TIGHT,
				new Image(disp, getClass().getResourceAsStream("res/distribute-horizontal-tight.gif")));
		imageRegistry.put(DISTRIBUTE_VERTICAL_LOOSE,
				new Image(disp, getClass().getResourceAsStream("res/distribute-vertical-loose.gif")));
		imageRegistry.put(DISTRIBUTE_VERTICAL_TIGHT,
				new Image(disp, getClass().getResourceAsStream("res/distribute-vertical-tight.gif")));
	}

	@Override
	public void dispose() {
		BNAUtils.checkLock();
		if (imageRegistry != null) {
			imageRegistry.dispose();
		}
	}

	@Override
	public void fillMenu(IBNAView view, ICoordinate location, ThingsAtLocation things, IMenuManager menu) {
		BNAUtils.checkLock();
		if (imageRegistry == null) {
			loadImages(view);
		}

		// Make sure at least two things have either an anchor point or bounding box.
		Collection<IThing> selectedThings = BNAUtils.getSelectedThings(view.getBNAWorld().getBNAModel());
		final List<IThing> thingsToEditList = new ArrayList<IThing>();
		for (IThing st : selectedThings) {
			if (st instanceof IHasMutableBoundingBox || st instanceof IHasMutableAnchorPoint) {
				thingsToEditList.add(st);
			}
		}
		if (thingsToEditList.size() > 2) {
			final IThing[] thingsToEdit = thingsToEditList.toArray(new IThing[thingsToEditList.size()]);
			final Runnable undoRunnable = BNAOperations.takeSnapshotOfLocations(model, thingsToEditList);

			IMenuManager alignMenu = new MenuManager("Align");
			alignMenu.add(new BNAAction("Align &Top", imageRegistry.getDescriptor(ALIGN_TOP)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.align(thingsToEdit, VerticalAlignment.TOP);
					BNAOperations.runnable("Align", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			alignMenu.add(new BNAAction("Align &Middle", imageRegistry.getDescriptor(ALIGN_MIDDLE)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.align(thingsToEdit, VerticalAlignment.MIDDLE);
					BNAOperations.runnable("Align", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			alignMenu.add(new BNAAction("Align &Bottom", imageRegistry.getDescriptor(ALIGN_BOTTOM)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.align(thingsToEdit, VerticalAlignment.BOTTOM);
					BNAOperations.runnable("Align", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			alignMenu.add(new BNAAction("Align &Left", imageRegistry.getDescriptor(ALIGN_LEFT)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.align(thingsToEdit, HorizontalAlignment.LEFT);
					BNAOperations.runnable("Align", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			alignMenu.add(new BNAAction("Align &Center", imageRegistry.getDescriptor(ALIGN_CENTER)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.align(thingsToEdit, HorizontalAlignment.CENTER);
					BNAOperations.runnable("Align", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			alignMenu.add(new BNAAction("Align &Right", imageRegistry.getDescriptor(ALIGN_RIGHT)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.align(thingsToEdit, HorizontalAlignment.RIGHT);
					BNAOperations.runnable("Align", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			menu.add(alignMenu);

			IMenuManager distributeMenu = new MenuManager("Distribute");
			distributeMenu.add(new BNAAction("Distribute Horizontal Loose",
					imageRegistry.getDescriptor(DISTRIBUTE_HORIZONTAL_LOOSE)) {
				@Override
				public void runWithLock() {
					BNADistributeUtils.distributeHorizontalLoose(thingsToEdit);
					BNAOperations.runnable("Distribute", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			distributeMenu.add(new BNAAction("Distribute Horizontal Tight",
					imageRegistry.getDescriptor(DISTRIBUTE_HORIZONTAL_TIGHT)) {
				@Override
				public void runWithLock() {
					BNADistributeUtils.distributeHorizontalTight(thingsToEdit);
					BNAOperations.runnable("Distribute", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
				}
			});
			distributeMenu.add(
					new BNAAction("Distribute Vertical Loose", imageRegistry.getDescriptor(DISTRIBUTE_VERTICAL_LOOSE)) {
						@Override
						public void runWithLock() {
							BNADistributeUtils.distributeVerticalLoose(thingsToEdit);
							BNAOperations.runnable("Distribute", undoRunnable,
									BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
						}
					});
			distributeMenu.add(
					new BNAAction("Distribute Vertical Tight", imageRegistry.getDescriptor(DISTRIBUTE_VERTICAL_TIGHT)) {
						@Override
						public void runWithLock() {
							BNADistributeUtils.distributeVerticalTight(thingsToEdit);
							BNAOperations.runnable("Distribute", undoRunnable,
									BNAOperations.takeSnapshotOfLocations(model, thingsToEditList), false);
						}
					});
			menu.add(distributeMenu);
		}

		// Select all things if nothing is selected.
		Collection<IThing> thingsToFlip = Lists.newArrayList(BNAUtils.getSelectedThings(model));
		if (thingsToFlip.isEmpty()) {
			thingsToFlip.addAll(model.getAllThings());
		}
		thingsToFlip = Collections2.filter(thingsToFlip, BNAAlignUtils.FLIP_THING_PREDICATE);
		if (thingsToFlip.size() >= 1) {
			final Collection<IThing> finalThingsToFlip = thingsToFlip;
			final Runnable undoRunnable = BNAOperations.takeSnapshotOfLocations(model, thingsToEditList);

			IMenuManager flipMenu = new MenuManager("Flip");
			flipMenu.add(new BNAAction("Flip &Vertically", imageRegistry.getDescriptor(ALIGN_MIDDLE)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.flip(stickLogic, finalThingsToFlip, false);
					BNAOperations.runnable("Flip Vertically", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, finalThingsToFlip), false);
				}
			});
			flipMenu.add(new BNAAction("Flip &Horizontally", imageRegistry.getDescriptor(ALIGN_CENTER)) {
				@Override
				public void runWithLock() {
					BNAAlignUtils.flip(stickLogic, finalThingsToFlip, true);
					BNAOperations.runnable("Flip Horizontally", undoRunnable,
							BNAOperations.takeSnapshotOfLocations(model, finalThingsToFlip), false);
				}
			});
			menu.add(flipMenu);
		}
	}
}
