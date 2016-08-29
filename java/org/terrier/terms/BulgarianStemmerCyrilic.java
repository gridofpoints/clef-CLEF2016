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
 * Bulgarian stemmer cyrilic- same as light stemmer except that it uses the
 * original documents in cyrilic (original taken from
 * http://members.unine.ch/jacques.savoy/clef/index.html by Ljiljana Dolamic)
 * 
 * @author <a href="mailto:silvello@dei.unipd.it">Gianmaria Silvello</a>
 * @version 0.1
 * @since 0.1
 * 
 */
public class BulgarianStemmerCyrilic extends StemmerTermPipeline {

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
	public BulgarianStemmerCyrilic() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public BulgarianStemmerCyrilic(TermPipeline next) {
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
			if ((word.charAt(len) == '\u0442') && (word.charAt(len - 1) == '\u044A')) {
				word.delete(len - 1, len + 1);
				return;
			}

		} /* end if len > 4 */
		if (len > 4) {
			/* -jat for masc */
			if (word.substring(len - 1, len + 1).equals("\u044F\u0442")) {
				if (isVowel(word.charAt(len - 2))) {

					word.replace(len - 1, len + 1, "\u0439");
				} else
					word.delete(len - 1, len + 1);

				return;
			}
		} /* end if len >3 */
		if (len > 3) {
			/* -to for neutral */
			if ((word.charAt(len) == '\u043E') && (word.charAt(len - 1) == '\u0442')) {
				word.delete(len - 1, len + 1);
				return;
			}
			/* -te for neutral */
			if ((word.charAt(len) == '\u0435') && (word.charAt(len - 1) == '\u0442')) {
				word.delete(len - 1, len + 1);
				return;
			}
			/* -ta for femi */
			if ((word.charAt(len) == '\u0430') && (word.charAt(len - 1) == '\u0442')) {
				word.delete(len - 1, len + 1);
				return;
			}

		} /* end if len > 2 */
		return;
	}

	private void normalize(StringBuilder word) {
		int len = word.length() - 1;
		if (len > 3 && ((word.charAt(len) == '\u0435') || (word.charAt(len) == '\u0438'))
				&& (word.charAt(len - 1) == '\u0438')) {
			word.delete(len - 1, len + 1);
			len -= 2;
		}
		if (len > 2) {
			/* -ja for definite art masc or plur */
			if (word.charAt(len) == ('\u044F')) {

				if (isVowel(word.charAt(len - 1))) {
					word.replace(len, len + 1, "\u0439");

				} else {
					word.deleteCharAt(len);
					len--;
				}
			}
			/* remove the final -a, -o */
			if ((word.charAt(len) == '\u0430') || (word.charAt(len) == '\u043E') || (word.charAt(len) == '\u0439')) {
				word.deleteCharAt(len);
				len--;
			}
			/* remove the final -e ,-i */
			if (word.charAt(len) == '\u0435' || (word.charAt(len) == '\u0438')) {
				word.deleteCharAt(len);
				// palatalisation(word);
				len = word.length() - 1;
			}
		} /* end if len > 2 */

		/* replace the final -jn into -n */
		if (len > 2) {
			if ((word.charAt(len) == '\u043D') && (word.charAt(len - 1) == '\u0439')) {
				if (isVowel(word.charAt(len - 2))) {

					word.setCharAt(len - 1, '\u043D');
					word.deleteCharAt(len);
					return;
				}
			}
			/* replace the final -xxex -xxx */
			if ((!isVowel(word.charAt(len))) && (word.charAt(len - 1) == '\u0435')) {
				word.setCharAt(len - 1, word.charAt(len));
				word.delete(len, len + 1);
				return;
			}
		} /* end if len > 2 */
		/* replace the final -xx(Hard sign)x -xxx */
		if (len > 3) {
			if ((word.charAt(len - 1) == '\u044A')) {
				word.setCharAt(len - 1, word.charAt(len));
				word.delete(len, len + 1);
				return;
			}
		} /* end if len > 3 */

		return;
	}

	private void remove_plural(StringBuilder word) {
		int len = word.length() - 1;

		if (len > 5) {
			/* -ishta */
			if ((word.charAt(len) == '\u0430') && (word.charAt(len - 1) == '\u0449')
					&& (word.charAt(len - 2) == '\u0438')) {
				word.delete(len - 2, len + 1);
				// palatalisation(word);
				return;
			}
			/* -ishte */
			if ((word.charAt(len) == '\u0435') && (word.charAt(len - 1) == '\u0449')
					&& (word.charAt(len - 2) == '\u0438')) {
				word.delete(len - 2, len + 1);
				// palatalisation(word);
				return;
			}
			/* -ovtsi into -o */
			if ((word.charAt(len) == '\u0438') && (word.charAt(len - 1) == '\u0446')
					&& (word.charAt(len - 2) == '\u0432') && (word.charAt(len - 3) == '\u043E')) {
				word.delete(len - 2, len + 1);
				return;
			}
			/* -evtsi into -e */
			if ((word.charAt(len) == '\u0438') && (word.charAt(len - 1) == '\u0446')
					&& (word.charAt(len - 2) == '\u0432') && (word.charAt(len - 3) == '\u0435')) {
				word.delete(len - 2, len + 1);
				return;
			}
		} /* end if len > 5 */

		if (len > 3) {
			/* -ove */
			if ((word.charAt(len) == '\u0435') && (word.charAt(len - 1) == '\u0432')
					&& (word.charAt(len - 2) == '\u043E')) {
				word.delete(len - 2, len + 1);
				return;
			}
			/* -eve to j */
			if ((word.charAt(len) == '\u043E') && (word.charAt(len - 1) == '\u0432')
					&& (word.charAt(len - 2) == '\u043E')) {
				if (isVowel(word.charAt(len - 3))) {
					word.setCharAt(len - 2, '\u0439');
					word.delete(len - 1, len + 1);
				} else
					word.delete(len - 2, len + 1);
				return;
			}
		} /* end if len >3 */

		if (len > 2) {
			/* -ta */
			if ((word.charAt(len) == '\u0430') && (word.charAt(len - 1) == '\u0442')) {
				word.delete(len - 1, len + 1);
				return;
			}
			/* -..e.i into -..ja. */
			if ((word.charAt(len) == '\u0438') && (word.charAt(len - 2) == '\u0435')) {
				word.setCharAt(len - 2, '\u044F');
				return;
			}
		} /* end if len > 2 */

		return;
	}

	private void palatalisation(StringBuilder word) {
		int len = word.length() - 1;
		if (len > 1) {
			/* -ts or -ch into -k */
			if ((word.charAt(len) == '\u0446') || (word.charAt(len) == '\u0447')) {
				word.setCharAt(len, '\u043A');

				return;
			}

			/* -zh, -z into -g */
			if ((word.charAt(len) == '\u0436') || (word.charAt(len) == '\u0437')) {
				word.setCharAt(len, '\u0433');

				return;
			}

			/* -s, -sh into -kh */
			if ((word.charAt(len) == '\u0441') || (word.charAt(len) == '\u0448')) {
				word.setCharAt(len, '\u0435');
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
		return (c == '\u0430' || c == '\u0435' || c == '\u0438' || c == '\u043E' || c == '\u0443' || c == '\u044A');
	}

	public static void main(String[] args) {
		try {
			BulgarianStemmerCyrilic stemmer = new BulgarianStemmerCyrilic();
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
			osw = new OutputStreamWriter(new FileOutputStream("BgCyr.dat"), "UTF8");

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* EOF */
}
