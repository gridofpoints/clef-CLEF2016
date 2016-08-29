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

import java.util.Map;
import java.util.WeakHashMap;

import org.terrier.terms.StemmerTermPipeline;
import org.terrier.terms.TermPipeline;

/**
 * Russian (light) stemmer (original taken from
 * http://members.unine.ch/jacques.savoy/clef/index.html)
 * 
 * @author <a href="mailto:silvello@dei.unipd.it">Gianmaria Silvello</a>
 * @version 0.1
 * @since 0.1
 * 
 */
public class WeakRussianStemmer extends StemmerTermPipeline {

	/** * A cache of words and their stems */
	static private Map<String, String> cache = new WeakHashMap<String, String>();
	/**
	 * A buffer of the current word being stemmed
	 */
	private StringBuffer sb = new StringBuffer();

	/**
	 * constructor
	 */
	public WeakRussianStemmer() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public WeakRussianStemmer(TermPipeline next) {
		super(next);
	}

	@Override
	public String stem(String input) {
		String result = cache.get(input);
		
		if (result != null)
			return result; // reset string buffer
		sb.delete(0, sb.length());
		sb.insert(0, input); // stemming...
		// removes case endings from nouns and adjectives
		removeCase(sb);
		normalize(sb);
		result = sb.toString();
		cache.put(input, result);
		return result;
	}

	private void normalize(StringBuffer buffer) {
		int len = buffer.length();
		if (len > 3) {
			if (buffer.substring(len - 1, len).equals("ь")) {
				buffer.delete(len - 1, len);
				return;
			}
			if (buffer.substring(len - 2, len).equals("нн")) {

				buffer.delete(len - 1, len);
				return;
			}
			if (buffer.substring(len - 1, len).equals("и")) {

				buffer.delete(len - 1, len);
				return;
			}
		} // len>3
	}

	private void removeCase(StringBuffer buffer) {
		int len = buffer.length(); // if( len> 6){
		if (buffer.substring(len - 4, len).equals("иями") || buffer.substring(len - 4, len).equals("оями")) {
			buffer.delete(len - 4, len);
			return;
		}
		// len>6
		if (len > 5)

		{
			if (buffer.substring(len - 3, len).equals("иям") || buffer.substring(len - 3, len).equals("иях")
					|| buffer.substring(len - 3, len).equals("оях") || buffer.substring(len - 3, len).equals("ями")
					|| buffer.substring(len - 3, len).equals("oям") || buffer.substring(len - 3, len).equals("oьв")
					|| buffer.substring(len - 3, len).equals("ами") || buffer.substring(len - 3, len).equals("его")
					|| buffer.substring(len - 3, len).equals("емu") || buffer.substring(len).equals("ери")
					|| buffer.substring(len).equals("ими") || buffer.substring(len).equals("ого")
					|| buffer.substring(len - 3, len).equals("ому") || buffer.substring(len).equals("ыми")
					|| buffer.substring(len).equals("оев"))

			{
				buffer.delete(len - 3, len);
				return;
			}
		} // len>5
		if (len > 4) {
			if (buffer.substring(len).equals("ая") || buffer.substring(len).equals("яя")
					|| buffer.substring(len).equals("ях") || buffer.substring(len - 2, len).equals("юю")
					|| buffer.substring(len).equals("ах") || buffer.substring(len).equals("ею")
					|| buffer.substring(len - 2, len).equals("их") || buffer.substring(len - 2, len).equals("ия")
					|| buffer.substring(len - 2, len).equals("ию") || buffer.substring(len - 2, len).equals("ьв")
					|| buffer.substring(len - 2, len).equals("ою") || buffer.substring(len - 2, len).equals("ую")
					|| buffer.substring(len - 2, len).equals("ям") || buffer.substring(len - 2, len).equals("ых")
					|| buffer.substring(len - 2, len).equals("ея") || buffer.substring(len - 2, len).equals("ам")
					|| buffer.substring(len - 2, len).equals("ее") || buffer.substring(len - 2, len).equals("ей")
					|| buffer.substring(len - 2, len).equals("ем") || buffer.substring(len - 2, len).equals("ев")
					|| buffer.substring(len - 2, len).equals("ий") || buffer.substring(len - 2, len).equals("им")
					|| buffer.substring(len - 2, len).equals("ое") || buffer.substring(len - 2, len).equals("ой")
					|| buffer.substring(len - 2, len).equals("ом") || buffer.substring(len - 2, len).equals("ов")
					|| buffer.substring(len - 2, len).equals("ыe") || buffer.substring(len - 2, len).equals("ыj")
					|| buffer.substring(len - 2, len).equals("ым") || buffer.substring(len - 2, len).equals("ми")) {
				buffer.delete(len - 2, len);
				return;
			}
		}
		if (len > 3) {
			if (buffer.substring(len - 1, len).equals("а") || buffer.substring(len - 1, len).equals("е")
					|| buffer.substring(len - 1, len).equals("и") || buffer.substring(len - 1, len).equals("о")
					|| buffer.substring(len - 1, len).equals("у") || buffer.substring(len - 1, len).equals("й")
					|| buffer.substring(len - 1, len).equals("ы") || buffer.substring(len - 1, len).equals("я")
					|| buffer.substring(len - 1, len).equals("ю") || buffer.substring(len - 1, len).equals("ь")) {
				buffer.delete(len - 1, len);
				return;
			}
		} // len>3
	}

}
