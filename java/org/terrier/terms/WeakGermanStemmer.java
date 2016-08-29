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
 * German weak stemmer (original taken from http://members.unine.ch/jacques.savoy/clef/index.html)
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
public class WeakGermanStemmer extends StemmerTermPipeline
{
	/** 
	 * constructor 
	 */
	public WeakGermanStemmer() {
		super();
	}
	/** 
	 * constructor
	 * @param next
	 */
	public WeakGermanStemmer(TermPipeline next) {
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
	      switch(s[i]) {
	        case 'ä':
	        case 'à':
	        case 'á':
	        case 'â': s[i] = 'a'; break;
	        case 'ö':
	        case 'ò':
	        case 'ó':
	        case 'ô': s[i] = 'o'; break;
	        case 'ï':
	        case 'ì':
	        case 'í':
	        case 'î': s[i] = 'i'; break;
	        case 'ü': 
	        case 'ù': 
	        case 'ú':
	        case 'û': s[i] = 'u'; break;
	      }
	    
	    len = step1(s, len);
	    return step2(s, len);
	  }
	  
	  private boolean stEnding(char ch) {
	    switch(ch) {
	      case 'b':
	      case 'd':
	      case 'f':
	      case 'g':
	      case 'h':
	      case 'k':
	      case 'l':
	      case 'm':
	      case 'n':
	      case 't': return true;
	      default: return false;
	    }
	  }
	  
	  private int step1(char s[], int len) {
	    if (len > 5 && s[len-3] == 'e' && s[len-2] == 'r' && s[len-1] == 'n')
	      return len - 3;
	    
	    if (len > 4 && s[len-2] == 'e')
	      switch(s[len-1]) {
	        case 'm':
	        case 'n':
	        case 'r':
	        case 's': return len - 2;
	      }
	    
	    if (len > 3 && s[len-1] == 'e')
	      return len - 1;
	    
	    if (len > 3 && s[len-1] == 's' && stEnding(s[len-2]))
	      return len - 1;
	    
	    return len;
	  }
	  
	  private int step2(char s[], int len) {
	    if (len > 5 && s[len-3] == 'e' && s[len-2] == 's' && s[len-1] == 't')
	      return len - 3;
	    
	    if (len > 4 && s[len-2] == 'e' && (s[len-1] == 'r' || s[len-1] == 'n'))
	      return len - 2;
	    
	    if (len > 4 && s[len-2] == 's' && s[len-1] == 't' && stEnding(s[len-3]))
	      return len - 2;
	    
	    return len;
	  }
}
