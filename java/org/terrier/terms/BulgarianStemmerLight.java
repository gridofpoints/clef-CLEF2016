/*
 * Copyright 2015 University of Padua, Italy
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.terrier.terms;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Bulgarian stemmer- removes articals,plurals and some derivational suffixes
 * Done by J. Savoy (University of Neuchatel, www.unine.ch/info/clef/). Author:
 * Ljiljana Dolamic
 * 
 * @author <a href="mailto:silvello@dei.unipd.it">Gianmaria Silvello</a>
 * @version 0.1
 * @since 0.1
 * 
 */
public class BulgarianStemmerLight extends StemmerTermPipeline {

	/**
	 * A cache of words and their stems
	 */
	static private Map<String, String> cache = new WeakHashMap<String, String>();

	/**
	 * A buffer of the current word being stemmed
	 */
	private StringBuilder sb = new StringBuilder();

	/**
	 * constructor
	 */
	public BulgarianStemmerLight() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public BulgarianStemmerLight(TermPipeline next) {
		super(next);
	}

	@Override
	public String stem(String word) {
		String result = cache.get(word);

		if (result != null)
			return result;

		//
		sb.delete(0, sb.length());

		//
		sb.append(word);

		/* remove the definite article */
		remove_article(sb);
		/* remove the plural suffix */
		remove_plural(sb);
		/* remove derivational suffix */

		normalize(sb);

		palatalisation(sb);

		result = sb.toString();
		cache.put(word, result);

		return result;
	}

	private void remove_article(StringBuilder word) {
		int len = word.length() - 1;

		/* article */
		if (len > 4) {
			/* -(Hard sign)t for masc */
			if ((word.charAt(len) == 't') && (word.charAt(len - 1) == 'h') && (word.charAt(len - 2) == 'u')) {
				word.delete(len - 2, len + 1);
				return;
			}

		} /* end if len > 4 */
		if (len > 3) {
			/* -jat for masc */
			if (word.substring(len - 2, len + 1).equals("jat")) {
				if (isVowel(word.charAt(len - 3)) || ((word.charAt(len - 3) == 'h') && (word.charAt(len - 4) == 'u'))) {

					word.delete(len - 1, len + 1);
				} else
					word.delete(len - 2, len + 1);

				return;
			}
		} /* end if len >3 */
		if (len > 2) {
			/* -to for neutral */
			if ((word.charAt(len) == 'o') && (word.charAt(len - 1) == 't')
					&& !word.substring(len - 3, len - 1).equals("sh")) {
				word.delete(len - 1, len + 1);
				return;
			}
			/* -te for neutral */
			if ((word.charAt(len) == 'e') && (word.charAt(len - 1) == 't')
					&& !word.substring(len - 3, len - 1).equals("sh")) {
				word.delete(len - 1, len + 1);
				return;
			}
			/* -ta for femi */
			if ((word.charAt(len) == 'a') && (word.charAt(len - 1) == 't')
					&& !word.substring(len - 3, len - 1).equals("sh")) {
				word.delete(len - 1, len + 1);
				return;
			}

		} /* end if len > 2 */
		return;
	}

	private void normalize(StringBuilder word) {
		int len = word.length() - 1;
		if (len > 3 && ((word.charAt(len) == 'e') || (word.charAt(len) == 'i')) && (word.charAt(len - 1) == 'i')) {
			word.delete(len - 1, len + 1);
			len -= 2;
		}
		if (len > 2) {
			/* -ja for definite art masc or plur */
			if (word.substring(len - 1, len + 1).equals("ja")) {

				if (isVowel(word.charAt(len - 2)) || ((word.charAt(len - 2) == 'h') && (word.charAt(len - 3) == 'u'))) {
					word.deleteCharAt(len);
					len--;
				} else {
					word.delete(len - 1, len + 1);
					len -= 2;
				}
			}
			/* remove the final -a, -o */
			if ((word.charAt(len) == 'a') || (word.charAt(len) == 'o') || (word.charAt(len) == 'j')) {
				word.deleteCharAt(len);
				len--;
			}
			/* remove the final -e ,-i */
			if (word.charAt(len) == 'e' || (word.charAt(len) == 'i')) {
				word.deleteCharAt(len);
				// palatalisation(word);
				len = word.length() - 1;
			}
		} /* end if len > 2 */

		/* replace the final -jn into -n */
		if (len > 2) {
			if ((word.charAt(len) == 'n') && (word.charAt(len - 1) == 'j')) {
				if (isVowel(word.charAt(len - 2)) || ((word.charAt(len - 2) == 'h') && (word.charAt(len - 3) == 'u'))) {

					word.setCharAt(len - 1, 'n');
					word.deleteCharAt(len);
					return;
				}
			}
			/* replace the final -xxex -xxx */
			if ((!isVowel(word.charAt(len))) && (word.charAt(len - 1) == 'e')) {
				word.setCharAt(len - 1, word.charAt(len));
				word.delete(len, len + 1);
				return;
			}
		} /* end if len > 2 */
		/* replace the final -xx(Hard sign)x -xxx */
		if (len > 3) {
			if ((word.charAt(len - 1) == 'h') && (word.charAt(len - 2) == 'u')) {
				word.setCharAt(len - 2, word.charAt(len));
				word.delete(len - 1, len + 1);
				return;
			}
		} /* end if len > 3 */

		return;
	}

	private void remove_plural(StringBuilder word) {
		int len = word.length() - 1;

		if (len > 5) {
			/* -ishta */
			if ((word.charAt(len) == 'a') && (word.charAt(len - 1) == 't') && (word.charAt(len - 2) == 'h')
					&& (word.charAt(len - 3) == 's') && (word.charAt(len - 4) == 'i')) {
				word.delete(len - 4, len + 1);
				// palatalisation(word);
				return;
			}
			/* -ishte */
			if ((word.charAt(len) == 'e') && (word.charAt(len - 1) == 't') && (word.charAt(len - 2) == 'h')
					&& (word.charAt(len - 3) == 's') && (word.charAt(len - 4) == 'i')) {
				word.delete(len - 4, len + 1);
				// palatalisation(word);
				return;
			}
			/* -ovtsi into -o */
			if ((word.charAt(len) == 'i') && (word.charAt(len - 1) == 's') && (word.charAt(len - 2) == 't')
					&& (word.charAt(len - 3) == 'v') && (word.charAt(len - 4) == 'o')) {
				word.delete(len - 3, len + 1);
				return;
			}
			/* -evtsi into -e */
			if ((word.charAt(len) == 'i') && (word.charAt(len - 1) == 's') && (word.charAt(len - 2) == 't')
					&& (word.charAt(len - 3) == 'v') && (word.charAt(len - 4) == 'e')) {
				word.delete(len - 3, len + 1);
				return;
			}
		} /* end if len > 5 */

		if (len > 3) {
			/* -ove */
			if ((word.charAt(len) == 'e') && (word.charAt(len - 1) == 'v') && (word.charAt(len - 2) == 'o')) {
				word.delete(len - 2, len + 1);
				return;
			}
			/* -eve to j */
			if ((word.charAt(len) == 'e') && (word.charAt(len - 1) == 'v') && (word.charAt(len - 2) == 'e')) {
				if (isVowel(word.charAt(len - 3)) || ((word.charAt(len - 3) == 'h') && (word.charAt(len - 4) == 'u'))) {
					word.setCharAt(len - 2, 'j');
					word.delete(len - 1, len + 1);
				} else
					word.delete(len - 2, len + 1);
				return;
			}
		} /* end if len >3 */

		if (len > 2) {
			/* -ta */
			if ((word.charAt(len) == 'a') && (word.charAt(len - 1) == 't')
					&& !word.substring(len - 3, len - 1).equals("sh")) {
				word.delete(len - 1, len + 1);
				return;
			}
			/* -..e.i into -..ja. */
			if ((word.charAt(len) == 'i') && (word.charAt(len - 2) == 'e')) {
				word.setCharAt(len - 2, 'j');
				word.insert(len - 1, 'a');
				return;
			}
		} /* end if len > 2 */

		return;
	}

	private void palatalisation(StringBuilder word) {
		int len = word.length() - 1;
		if (len > 1) {
			/* -ts or -ch into -k */
			if (((word.charAt(len) == 's') && (word.charAt(len - 1) == 't'))
					|| ((word.charAt(len) == 'h') && (word.charAt(len - 1) == 'c'))) {
				word.setCharAt(len - 1, 'k');
				word.deleteCharAt(len);
				return;
			}
			/* -z into -g */
			if ((word.charAt(len) == 'z')) {
				word.setCharAt(len, 'g');
				return;
			}
			/* -zh into -g */
			if ((word.charAt(len - 1) == 'z') && (word.charAt(len) == 'h')) {
				word.setCharAt(len - 1, 'g');
				word.deleteCharAt(len);
				return;
			}
			/* -s into -kh */
			if ((word.charAt(len) == 's')) {
				word.setCharAt(len, 'k');
				word.append('h');
				return;
			}
			/* -sh into -kh */
			if ((word.charAt(len) == 'h') && (word.charAt(len - 1) == 's')) {
				word.setCharAt(len - 1, 'k');
				return;
			}
		}

	}

	/**
	 * Returns true if the given character is a vowel
	 * 
	 * @param c
	 *            the character to be tested
	 * @return true if the given character is a vowel
	 */
	private boolean isVowel(char c) {
		return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u');
	}

	public static void main(String[] args) {
		try {
			BulgarianStemmerLight stemmer = new BulgarianStemmerLight();
			createNewFile();
			// Read the list of words to remove
			InputStreamReader isr = new InputStreamReader(new FileInputStream(args[0]), "UTF8");
			BufferedReader br = new BufferedReader(isr);

			while (br.ready()) {
				String line = br.readLine().toLowerCase();
				String[] s = line.split("\\s");
				for (String w : s)
					// System.out.println(stemmer.stem(w));
					write(w + "  --->  " + stemmer.stem(w));
			}

			br.close();
			isr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * The stream to which data are written.
	 */
	private static OutputStreamWriter osw = null;

	/**
	 * Writes the given text to the current output file.
	 * 
	 * @param text
	 *            the text to write.
	 */
	private static void write(String text) {
		try {
			osw.write('\n');
			osw.write(text);
			osw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Close the current output file and generates a new empty file
	 */
	private static void createNewFile() {
		try {
			if (osw != null) {
				osw.flush();
				osw.close();
			}
			osw = new OutputStreamWriter(new FileOutputStream("BgLight.dat"), "UTF-8");

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* EOF */
}
