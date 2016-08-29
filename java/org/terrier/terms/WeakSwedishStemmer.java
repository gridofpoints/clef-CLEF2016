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

import static org.terrier.terms.StemmerUtil.*;

/**
 * Swedish weak stemmer (original taken from
 * http://members.unine.ch/jacques.savoy/clef/index.html)
 * 
 * <p>
 * This stemmer implements the algorithm described in: <i>Report on CLEF-2001
 * Experiments</i> Jacques Savoy
 * 
 * @author <a href="mailto:silvello@dei.unipd.it">Gianmaria Silvello</a>
 * @version 0.1
 * @since 0.1
 * 
 */
public class WeakSwedishStemmer extends StemmerTermPipeline {
	/**
	 * constructor
	 */
	public WeakSwedishStemmer() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public WeakSwedishStemmer(TermPipeline next) {
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
	    if (len > 4 && s[len-1] == 's')
	      len--;
	    
	    if (len > 7 && 
	        (endsWith(s, len, "elser") || 
	         endsWith(s, len, "heten")))
	      return len - 5;
	    
	    if (len > 6 &&
	        (endsWith(s, len, "arne") ||
	         endsWith(s, len, "erna") ||
	         endsWith(s, len, "ande") ||
	         endsWith(s, len, "else") ||
	         endsWith(s, len, "aste") ||
	         endsWith(s, len, "orna") ||
	         endsWith(s, len, "aren")))
	      return len - 4;
	    
	    if (len > 5 &&
	        (endsWith(s, len, "are") ||
	         endsWith(s, len, "ast") ||
	         endsWith(s, len, "het")))
	      return len - 3;
	    
	    if (len > 4 &&
	        (endsWith(s, len, "ar") ||
	         endsWith(s, len, "er") ||
	         endsWith(s, len, "or") ||
	         endsWith(s, len, "en") ||
	         endsWith(s, len, "at") ||
	         endsWith(s, len, "te") ||
	         endsWith(s, len, "et")))
	      return len - 2;
	    
	    if (len > 3)
	      switch(s[len-1]) {
	        case 't':
	        case 'a':
	        case 'e':
	        case 'n': return len - 1;
	      }
	    
	    return len;
	  }
}
