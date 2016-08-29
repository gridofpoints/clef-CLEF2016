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

/**
 * Spanish weak stemmer (original taken from
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
public class WeakSpanishStemmer extends StemmerTermPipeline {
	/**
	 * constructor
	 */
	public WeakSpanishStemmer() {
		super();
	}

	/**
	 * constructor
	 * 
	 * @param next
	 */
	public WeakSpanishStemmer(TermPipeline next) {
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
		    if (len < 5)
		      return len;
		    
		    for (int i = 0; i < len; i++)
		      switch(s[i]) {
		        case 'à': 
		        case 'á':
		        case 'â':
		        case 'ä': s[i] = 'a'; break;
		        case 'ò':
		        case 'ó':
		        case 'ô':
		        case 'ö': s[i] = 'o'; break;
		        case 'è':
		        case 'é':
		        case 'ê':
		        case 'ë': s[i] = 'e'; break;
		        case 'ù':
		        case 'ú':
		        case 'û':
		        case 'ü': s[i] = 'u'; break;
		        case 'ì':
		        case 'í':
		        case 'î':
		        case 'ï': s[i] = 'i'; break;
		      }
		    
		    switch(s[len-1]) {
		      case 'o':
		      case 'a':
		      case 'e': return len - 1;
		      case 's':
		        if (s[len-2] == 'e' && s[len-3] == 's' && s[len-4] == 'e')
		          return len-2;
		        if (s[len-2] == 'e' && s[len-3] == 'c') {
		          s[len-3] = 'z';
		          return len - 2;
		        }
		        if (s[len-2] == 'o' || s[len-2] == 'a' || s[len-2] == 'e')
		          return len - 2;
		    }
		    
		    return len;
		  }
}
