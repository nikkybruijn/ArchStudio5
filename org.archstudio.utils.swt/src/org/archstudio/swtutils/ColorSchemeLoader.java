package org.archstudio.swtutils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.swt.graphics.RGB;

// Generate new tetradic color schemes at:
// http://wellstyled.com/tools/colorscheme2/index-en.html

public class ColorSchemeLoader {

	protected ColorScheme[] defaultColorSchemes = null;

	private ColorSchemeLoader() {
	}

	public ColorScheme[] getDefaultColorSchemes() {
		if (defaultColorSchemes == null) {
			defaultColorSchemes = loadDefaultColorSchemes();
		}
		return defaultColorSchemes;
	}

	protected ColorScheme[] loadDefaultColorSchemes() {
		InputStream is = ColorSchemeLoader.class.getClassLoader().getResourceAsStream(
				"edu/uci/isr/widgets/swt/res/colorschemes.txt");
		return loadColorSchemes(is);
	}

	public ColorScheme[] loadColorSchemes(InputStream is) {
		List<ColorScheme> schemeList = new ArrayList<ColorScheme>();

		String name = null;
		List<RGB[]> colorArrayList = new ArrayList<RGB[]>();

		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			while (true) {
				String line = br.readLine();
				if (line == null) {
					if (name != null) {
						RGB[][] colorArrays = colorArrayList.toArray(new RGB[0][]);
						ColorScheme scheme = new ColorScheme(name, colorArrays);
						schemeList.add(scheme);
					}
					break;
				}
				line = line.trim();
				if (line.length() == 0) {
					continue;
				}
				else if (line.startsWith("#")) {
					continue;
				}
				else if (line.startsWith("&")) {
					if (name != null) {
						RGB[][] colorArrays = colorArrayList.toArray(new RGB[0][]);
						ColorScheme scheme = new ColorScheme(name, colorArrays);
						schemeList.add(scheme);
					}
					name = line.substring(1).trim();
					colorArrayList.clear();
				}
				else {
					String[] colorStrings = line.split("\\b");
					List<RGB> colorList = new ArrayList<RGB>();
					for (String colorString2 : colorStrings) {
						String colorString = colorString2.trim();
						if (colorString.length() > 0) {
							try {
								int colorRgb = Integer.parseInt(colorString, 16);

								int r = (colorRgb & 0xff0000) >> 16;
								int g = (colorRgb & 0x00ff00) >> 8;
								int b = colorRgb & 0x0000ff;

								RGB rgb = new RGB(r, g, b);
								colorList.add(rgb);
							}
							catch (NumberFormatException nfe) {
							}
						}
					}
					RGB[] colorArray = colorList.toArray(new RGB[0]);
					colorArrayList.add(colorArray);
				}
			}
		}
		catch (IOException e) {
		}
		try {
			is.close();
		}
		catch (IOException ioe2) {
		}
		ColorScheme[] colorSchemeArray = schemeList.toArray(new ColorScheme[0]);
		return colorSchemeArray;
	}

	private static ColorSchemeLoader theInstance = null;

	public static synchronized ColorSchemeLoader getInstance() {
		if (theInstance == null) {
			theInstance = new ColorSchemeLoader();
		}
		return theInstance;
	}

}
