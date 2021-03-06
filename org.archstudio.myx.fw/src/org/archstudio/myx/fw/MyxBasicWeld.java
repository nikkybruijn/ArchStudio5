package org.archstudio.myx.fw;

import java.util.List;

class MyxBasicWeld implements IMyxWeld {

	private static final long serialVersionUID = 7382920318037362753L;

	protected final List<? extends IMyxName> requiredPath;
	protected final IMyxName requiredBrickName;
	protected final IMyxName requiredInterfaceName;

	protected final List<? extends IMyxName> providedPath;
	protected final IMyxName providedBrickName;
	protected final IMyxName providedInterfaceName;

	public MyxBasicWeld(List<? extends IMyxName> requiredPath, IMyxName requiredBrickName,
			IMyxName requiredInterfaceName, List<? extends IMyxName> providedPath, IMyxName providedBrickName,
			IMyxName providedInterfaceName) {
		this.requiredPath = requiredPath;
		this.requiredBrickName = requiredBrickName;
		this.requiredInterfaceName = requiredInterfaceName;
		this.providedPath = providedPath;
		this.providedBrickName = providedBrickName;
		this.providedInterfaceName = providedInterfaceName;
	}

	@Override
	public IMyxName getProvidedBrickName() {
		return providedBrickName;
	}

	@Override
	public IMyxName getProvidedInterfaceName() {
		return providedInterfaceName;
	}

	@Override
	public List<? extends IMyxName> getProvidedPath() {
		return providedPath;
	}

	@Override
	public IMyxName getRequiredBrickName() {
		return requiredBrickName;
	}

	@Override
	public IMyxName getRequiredInterfaceName() {
		return requiredInterfaceName;
	}

	@Override
	public List<? extends IMyxName> getRequiredPath() {
		return requiredPath;
	}

	@Override
	public int hashCode() {
		return MyxUtils.hc(requiredPath) ^ MyxUtils.hc(requiredBrickName) ^ MyxUtils.hc(requiredInterfaceName)
				^ MyxUtils.hc(providedPath) ^ MyxUtils.hc(providedBrickName) ^ MyxUtils.hc(providedInterfaceName);
	}

	@Override
	public boolean equals(Object o) {
		return o == this || MyxUtils.classeq(this, o)
				&& MyxUtils.nulleq(this.requiredPath, ((MyxBasicWeld) o).requiredPath)
				&& MyxUtils.nulleq(this.requiredBrickName, ((MyxBasicWeld) o).requiredBrickName)
				&& MyxUtils.nulleq(this.requiredInterfaceName, ((MyxBasicWeld) o).requiredInterfaceName)
				&& MyxUtils.nulleq(this.providedPath, ((MyxBasicWeld) o).providedPath)
				&& MyxUtils.nulleq(this.providedBrickName, ((MyxBasicWeld) o).providedBrickName)
				&& MyxUtils.nulleq(this.providedInterfaceName, ((MyxBasicWeld) o).providedInterfaceName);

	}

	@Override
	public String toString() {
		return "MyxBasicWeld{requiredPath=" + MyxUtils.pathToString(requiredPath) + "; requiredBrickName="
				+ requiredBrickName + "; requiredInterfaceName=" + requiredInterfaceName + "; providedPath="
				+ MyxUtils.pathToString(providedPath) + "; providedBrickName=" + providedBrickName
				+ "; providedInterfaceName=" + providedInterfaceName + "}";

	}

}
