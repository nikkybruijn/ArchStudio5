package org.archstudio.archipelago.core;

import java.lang.reflect.InvocationTargetException;

import org.archstudio.myx.fw.Services;
import org.archstudio.prolog.PrologUtils;
import org.archstudio.xarchadt.IXArchADT;
import org.archstudio.xarchadt.ObjRef;
import org.archstudio.xarchadt.XArchADTProxy;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.SubMonitor;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.jface.action.Action;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.action.IMenuManager;
import org.eclipse.jface.operation.IRunnableWithProgress;
import org.eclipse.jface.viewers.TreeViewer;
import org.eclipse.ui.PlatformUI;

import alice.tuprolog.Prolog;

public class RootTreePlugin extends AbstractArchipelagoTreePlugin {
	public RootTreePlugin(TreeViewer viewer, final Services AS, ObjRef documentRootRef) {
		this.contentProvider = new RootContentProvider(AS, documentRootRef);
		this.labelProvider = new RootLabelProvider(AS);

		final TreeViewer fviewer = viewer;
		this.editorFocuser = new IArchipelagoEditorFocuser() {
			@Override
			public void focusEditor(String editorName, ObjRef[] refs) {
				fviewer.setSelection(null);
			}
		};

		this.contextMenuFillers = new IArchipelagoTreeContextMenuFiller[] { new IArchipelagoTreeContextMenuFiller() {
			@Override
			public void fillContextMenu(IMenuManager m, Object[] selectedNodes) {
				if (selectedNodes != null && selectedNodes.length == 1) {
					final Object selectedNode = selectedNodes[0];
					IAction newStructureAction = new Action("Temporary Entry Point") {
						@Override
						public void run() {
							process(XArchADTProxy.<EObject> proxy(AS.get(IXArchADT.class), (ObjRef) selectedNode));
						}
					};
					m.add(newStructureAction);
				}
			}
		} };
	}

	public void process(final EObject eObject) {
		try {
			PlatformUI.getWorkbench().getProgressService().run(true, true, new IRunnableWithProgress() {

				@Override
				public void run(IProgressMonitor monitor) throws InvocationTargetException, InterruptedException {
					SubMonitor subMonitor = SubMonitor.convert(monitor, "Prolog", 1);
					try {
						Prolog engine = new Prolog();
						PrologUtils.addFacts(engine, subMonitor.newChild(1), eObject);
					}
					catch (Throwable t) {
						throw new InvocationTargetException(t);
					}
				}
			});
		}
		catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
