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

import static org.terrier.terms.StemmerUtil.endsWith;

/**
 * Hungarian weak stemmer (original taken from
 * http://members.unine.ch/jacques.savoy/clef/index.html)
 * 
 * <p>
 * This stemmer implements the "UniNE" algorithm in:
 * <i>Light Stemming Approaches for the French, Portuguese, German and Hungarian Languages</i>
 * Jacques Savoy
 * 
 * @author <a href="mailto:silvello@dei.unipd.it">Gianmaria Silvello</a>
 * @version 0.1
 * @since 0.1
 * 
 */
public class WeakHungarianStemmer extends StemmerTermPipeline {
	/**
	 * constructor
	 */
	public WeakHungarianStemmer() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public WeakHungarianStemmer(TermPipeline next) {
		super(next);
	}

	@Override
	public String stem(String s) {

		char[] sc = s.toCharArray();

		int len = stem(sc, sc.length);

		char[] sstem = new char[len];
		System.arraycopy(sc, 0, sstem, 0, len);

		return new String(sstem);
	}

	public int stem(char s[], int len) {
		for (int i = 0; i < len; i++)
			switch (s[i]) {
			case 'á':
				s[i] = 'a';
				break;
			case 'ë':
			case 'é':
				s[i] = 'e';
				break;
			case 'í':
				s[i] = 'i';
				break;
			case 'ó':
			case 'ő':
			case 'õ':
			case 'ö':
				s[i] = 'o';
				break;
			case 'ú':
			case 'ű':
			case 'ũ':
			case 'û':
			case 'ü':
				s[i] = 'u';
				break;
			}

		len = removeCase(s, len);
		len = removePossessive(s, len);
		len = removePlural(s, len);
		return normalize(s, len);
	}

	private int removeCase(char s[], int len) {
		if (len > 6 && endsWith(s, len, "kent"))
			return len - 4;

		if (len > 5) {
			if (endsWith(s, len, "nak") || endsWith(s, len, "nek") || endsWith(s, len, "val") || endsWith(s, len, "vel")
					|| endsWith(s, len, "ert") || endsWith(s, len, "rol") || endsWith(s, len, "ban")
					|| endsWith(s, len, "ben") || endsWith(s, len, "bol") || endsWith(s, len, "nal")
					|| endsWith(s, len, "nel") || endsWith(s, len, "hoz") || endsWith(s, len, "hez")
					|| endsWith(s, len, "tol"))
				return len - 3;

			if (endsWith(s, len, "al") || endsWith(s, len, "el")) {
				if (!isVowel(s[len - 3]) && s[len - 3] == s[len - 4])
					return len - 3;
			}
		}

		if (len > 4) {
			if (endsWith(s, len, "at") || endsWith(s, len, "et") || endsWith(s, len, "ot") || endsWith(s, len, "va")
					|| endsWith(s, len, "ve") || endsWith(s, len, "ra") || endsWith(s, len, "re")
					|| endsWith(s, len, "ba") || endsWith(s, len, "be") || endsWith(s, len, "ul")
					|| endsWith(s, len, "ig"))
				return len - 2;

			if ((endsWith(s, len, "on") || endsWith(s, len, "en")) && !isVowel(s[len - 3]))
				return len - 2;

			switch (s[len - 1]) {
			case 't':
			case 'n':
				return len - 1;
			case 'a':
			case 'e':
				if (s[len - 2] == s[len - 3] && !isVowel(s[len - 2]))
					return len - 2;
			}
		}

		return len;
	}

	private int removePossessive(char s[], int len) {
		if (len > 6) {
			if (!isVowel(s[len - 5])
					&& (endsWith(s, len, "atok") || endsWith(s, len, "otok") || endsWith(s, len, "etek")))
				return len - 4;

			if (endsWith(s, len, "itek") || endsWith(s, len, "itok"))
				return len - 4;
		}

		if (len > 5) {
			if (!isVowel(s[len - 4]) && (endsWith(s, len, "unk") || endsWith(s, len, "tok") || endsWith(s, len, "tek")))
				return len - 3;

			if (isVowel(s[len - 4]) && endsWith(s, len, "juk"))
				return len - 3;

			if (endsWith(s, len, "ink"))
				return len - 3;
		}

		if (len > 4) {
			if (!isVowel(s[len - 3]) && (endsWith(s, len, "am") || endsWith(s, len, "em") || endsWith(s, len, "om")
					|| endsWith(s, len, "ad") || endsWith(s, len, "ed") || endsWith(s, len, "od")
					|| endsWith(s, len, "uk")))
				return len - 2;

			if (isVowel(s[len - 3]) && (endsWith(s, len, "nk") || endsWith(s, len, "ja") || endsWith(s, len, "je")))
				return len - 2;

			if (endsWith(s, len, "im") || endsWith(s, len, "id") || endsWith(s, len, "ik"))
				return len - 2;
		}

		if (len > 3)
			switch (s[len - 1]) {
			case 'a':
			case 'e':
				if (!isVowel(s[len - 2]))
					return len - 1;
				break;
			case 'm':
			case 'd':
				if (isVowel(s[len - 2]))
					return len - 1;
				break;
			case 'i':
				return len - 1;
			}

		return len;
	}

	@SuppressWarnings("fallthrough")
	private int removePlural(char s[], int len) {
		if (len > 3 && s[len - 1] == 'k')
			switch (s[len - 2]) {
			case 'a':
			case 'o':
			case 'e':
				if (len > 4)
					return len - 2; /* intentional fallthru */
			default:
				return len - 1;
			}
		return len;
	}

	private int normalize(char s[], int len) {
		if (len > 3)
			switch (s[len - 1]) {
			case 'a':
			case 'e':
			case 'i':
			case 'o':
				return len - 1;
			}
		return len;
	}

	private boolean isVowel(char ch) {
		switch (ch) {
		case 'a':
		case 'e':
		case 'i':
		case 'o':
		case 'u':
		case 'y':
			return true;
		default:
			return false;
		}
	}
}
