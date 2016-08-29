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

import org.terrier.terms.StemmerTermPipeline;
import org.terrier.terms.TermPipeline;

/**
 * Czech (light) stemmer (original taken from
 * http://members.unine.ch/jacques.savoy/clef/index.html)
 * 
 * @author <a href="mailto:silvello@dei.unipd.it">Gianmaria Silvello</a>
 * @version 0.1
 * @since 0.1
 * 
 */
public class CzechLightStemmer extends StemmerTermPipeline {

	/**
	 * A buffer of the current word being stemmed
	 */
	private StringBuffer sb = new StringBuffer();

	/**
	 * constructor
	 */
	public CzechLightStemmer() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public CzechLightStemmer(TermPipeline next) {
		super(next);
	}

	@Override
	public String stem(String input) {

		//
		input = input.toLowerCase();

		// reset string buffer
		sb.delete(0, sb.length());
		sb.insert(0, input);

		// stemming...
		// removes case endings from nouns and adjectives
		removeCase(sb);

		// removes possesive endings from names -ov- and -in-
		removePossessives(sb);

		return sb.toString();
	}

	private void palatalise(StringBuffer buffer) {
		int len = buffer.length();

		if (buffer.substring(len - 2, len).equals("ci") || buffer.substring(len - 2, len).equals("ce")
				|| buffer.substring(len - 2, len).equals("\u010di") || // -či
				buffer.substring(len - 2, len).equals("\u010de")) { // -č

			buffer.replace(len - 2, len, "k");
			return;
		}
		if (buffer.substring(len - 2, len).equals("zi") || buffer.substring(len - 2, len).equals("ze")
				|| buffer.substring(len - 2, len).equals("\u017ei") || // -ži
				buffer.substring(len - 2, len).equals("\u017ee")) { // -že

			buffer.replace(len - 2, len, "h");
			return;
		}
		if (buffer.substring(len - 3, len).equals("\u010dt\u011b") || // -čtě
				buffer.substring(len - 3, len).equals("\u010dti") || // -čti
				buffer.substring(len - 3, len).equals("\u010dt\u00ed")) { // -čté

			buffer.replace(len - 3, len, "ck");
			return;
		}
		if (buffer.substring(len - 2, len).equals("\u0161t\u011b") || // -ště
				buffer.substring(len - 2, len).equals("\u0161ti") || // -šti
				buffer.substring(len - 2, len).equals("\u0161t\u00ed")) { // -šté

			buffer.replace(len - 2, len, "sk");
			return;
		}
		buffer.delete(len - 1, len);
		return;
	}// palatalise

	private void removePossessives(StringBuffer buffer) {
		int len = buffer.length();

		if (len > 5) {
			if (buffer.substring(len - 2, len).equals("ov")) {

				buffer.delete(len - 2, len);
				return;
			}
			if (buffer.substring(len - 2, len).equals("\u016fv")) { // -ův

				buffer.delete(len - 2, len);
				return;
			}
			if (buffer.substring(len - 2, len).equals("in")) {

				buffer.delete(len - 1, len);
				palatalise(buffer);
				return;
			}
		}
		return;
	}// removePossessives

	private void removeCase(StringBuffer buffer) {
		int len = buffer.length();
		//
		if ((len > 7) && buffer.substring(len - 5, len).equals("atech")) {

			buffer.delete(len - 5, len);
			return;
		} // len>7
		if (len > 6) {
			if (buffer.substring(len - 4, len).equals("\u011btem")) { // -ětem

				buffer.delete(len - 3, len);
				palatalise(buffer);
				return;
			}
			if (buffer.substring(len - 4, len).equals("at\u016fm")) { // -atům
				buffer.delete(len - 4, len);
				return;
			}

		}
		if (len > 5) {
			if (buffer.substring(len - 3, len).equals("ech") || buffer.substring(len - 3, len).equals("ich")
					|| buffer.substring(len - 3, len).equals("\u00edch")) { // -ích

				buffer.delete(len - 2, len);
				palatalise(buffer);
				return;
			}
			if (buffer.substring(len - 3, len).equals("\u00e9ho") || // -ého
					buffer.substring(len - 3, len).equals("\u011bmi") || // -ěmi
					buffer.substring(len - 3, len).equals("emi") || buffer.substring(len - 3, len).equals("\u00e9mu") || // ému
					buffer.substring(len - 3, len).equals("\u011bte") || // -ěte
					buffer.substring(len - 3, len).equals("\u011bti") || // -ěti
					buffer.substring(len - 3, len).equals("iho") || buffer.substring(len - 3, len).equals("\u00edho") || // -ího
					buffer.substring(len - 3, len).equals("\u00edmi") || // -ími
					buffer.substring(len - 3, len).equals("imu")) {

				buffer.delete(len - 2, len);
				palatalise(buffer);
				return;
			}
			if (buffer.substring(len - 3, len).equals("\u00e1ch") || // -ách
					buffer.substring(len - 3, len).equals("ata") || buffer.substring(len - 3, len).equals("aty")
					|| buffer.substring(len - 3, len).equals("\u00fdch") || // -ých
					buffer.substring(len - 3, len).equals("ama") || buffer.substring(len - 3, len).equals("ami")
					|| buffer.substring(len - 3, len).equals("ov\u00e9") || // -ové
					buffer.substring(len - 3, len).equals("ovi") || buffer.substring(len - 3, len).equals("\u00fdmi")) { // -ými

				buffer.delete(len - 3, len);
				return;
			}
		}
		if (len > 4) {
			if (buffer.substring(len - 2, len).equals("em")) {

				buffer.delete(len - 1, len);
				palatalise(buffer);
				return;

			}
			if (buffer.substring(len - 2, len).equals("es") || buffer.substring(len - 2, len).equals("\u00e9m") || // -ém
					buffer.substring(len - 2, len).equals("\u00edm")) { // -ím

				buffer.delete(len - 2, len);
				palatalise(buffer);
				return;
			}
			if (buffer.substring(len - 2, len).equals("\u016fm")) { // -ům

				buffer.delete(len - 2, len);
				return;

			}
			if (buffer.substring(len - 2, len).equals("at") || buffer.substring(len - 2, len).equals("\u00e1m") || // -ám
					buffer.substring(len - 2, len).equals("os") || buffer.substring(len - 2, len).equals("us")
					|| buffer.substring(len - 2, len).equals("\u00fdm") || // -ým
					buffer.substring(len - 2, len).equals("mi") || buffer.substring(len - 2, len).equals("ou")) {

				buffer.delete(len - 2, len);
				return;
			}
		} // len>4
		if (len > 3) {
			if (buffer.substring(len - 1, len).equals("e") || buffer.substring(len - 1, len).equals("i")) {

				palatalise(buffer);
				return;

			}
			if (buffer.substring(len - 1, len).equals("\u00ed") || // -í
					buffer.substring(len - 1, len).equals("\u011b")) { // -ě

				palatalise(buffer);
				return;
			}
			if (buffer.substring(len - 1, len).equals("u") || buffer.substring(len - 1, len).equals("y")
					|| buffer.substring(len - 1, len).equals("\u016f")) { // -ů

				buffer.delete(len - 1, len);
				return;

			}
			if (buffer.substring(len - 1, len).equals("a") || buffer.substring(len - 1, len).equals("o")
					|| buffer.substring(len - 1, len).equals("\u00e1") || // -á
					buffer.substring(len - 1, len).equals("\u00e9") || // -é
					buffer.substring(len - 1, len).equals("\u00fd")) { // -ý

				buffer.delete(len - 1, len);
				return;
			}
		} // len>3
	}
}
