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
 * Portuguese weak stemmer (original taken from http://members.unine.ch/jacques.savoy/clef/index.html)
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
public class WeakPortugueseStemmer extends StemmerTermPipeline
{
	/** 
	 * constructor 
	 */
	public WeakPortugueseStemmer() {
		super();
	}
	/** 
	 * constructor
	 * @param next
	 */
	public WeakPortugueseStemmer(TermPipeline next) {
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
	    if (len < 4)
	      return len;
	    
	    len = removeSuffix(s, len);
	    
	    if (len > 3 && s[len-1] == 'a')
	      len = normFeminine(s, len);
	    
	    if (len > 4)
	      switch(s[len-1]) {
	        case 'e':
	        case 'a':
	        case 'o': len--; break;
	      }
	    
	    for (int i = 0; i < len; i++)
	      switch(s[i]) {
	        case 'à': 
	        case 'á':
	        case 'â':
	        case 'ä': 
	        case 'ã': s[i] = 'a'; break;
	        case 'ò':
	        case 'ó':
	        case 'ô':
	        case 'ö': 
	        case 'õ': s[i] = 'o'; break;
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
	        case 'ç': s[i] = 'c'; break;
	      }

	    return len;
	  }
	  
	  private int removeSuffix(char s[], int len) {
	    if (len > 4 && endsWith(s, len, "es"))
	      switch(s[len-3]) {
	        case 'r':
	        case 's':
	        case 'l':
	        case 'z': return len - 2;
	      }
	    
	    if (len > 3 && endsWith(s, len, "ns")) {
	      s[len - 2] = 'm';
	      return len - 1;
	    }
	    
	    if (len > 4 && (endsWith(s, len, "eis") || endsWith(s, len, "éis"))) {
	      s[len - 3] = 'e';
	      s[len - 2] = 'l';
	      return len - 1;
	    }
	    
	    if (len > 4 && endsWith(s, len, "ais")) {
	      s[len - 2] = 'l';
	      return len - 1;
	    }
	    
	    if (len > 4 && endsWith(s, len, "óis")) {
	      s[len - 3] = 'o';
	      s[len - 2] = 'l';
	      return len - 1;
	    }
	    
	    if (len > 4 && endsWith(s, len, "is")) {
	      s[len - 1] = 'l';
	      return len;
	    }
	    
	    if (len > 3 &&
	        (endsWith(s, len, "ões") ||
	         endsWith(s, len, "ães"))) {
	      len--;
	      s[len - 2] = 'ã';
	      s[len - 1] = 'o';
	      return len;
	    }
	    
	    if (len > 6 && endsWith(s, len, "mente"))
	      return len - 5;
	    
	    if (len > 3 && s[len-1] == 's')
	      return len - 1;
	    return len;
	  }

	  private int normFeminine(char s[], int len) {
	    if (len > 7 && 
	        (endsWith(s, len, "inha") ||
	         endsWith(s, len, "iaca") ||
	         endsWith(s, len, "eira"))) {
	      s[len - 1] = 'o';
	      return len;
	    }
	    
	    if (len > 6) {
	      if (endsWith(s, len, "osa") ||
	          endsWith(s, len, "ica") ||
	          endsWith(s, len, "ida") ||
	          endsWith(s, len, "ada") ||
	          endsWith(s, len, "iva") ||
	          endsWith(s, len, "ama")) {
	        s[len - 1] = 'o';
	        return len;
	      }
	      
	      if (endsWith(s, len, "ona")) {
	        s[len - 3] = 'ã';
	        s[len - 2] = 'o';
	        return len - 1;
	      }
	      
	      if (endsWith(s, len, "ora"))
	        return len - 1;
	      
	      if (endsWith(s, len, "esa")) {
	        s[len - 3] = 'ê';
	        return len - 1;
	      }
	      
	      if (endsWith(s, len, "na")) {
	        s[len - 1] = 'o';
	        return len;
	      }
	    }
	    return len;
	  }
}
