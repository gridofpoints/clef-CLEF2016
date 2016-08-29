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

import static org.terrier.terms.StemmerUtil.delete;
import static org.terrier.terms.StemmerUtil.endsWith;

/**
 * Finnish weak stemmer (original taken from http://members.unine.ch/jacques.savoy/clef/index.html)
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
public class WeakFinnishStemmer extends StemmerTermPipeline
{
	/** 
	 * constructor 
	 */
	public WeakFinnishStemmer() {
		super();
	}
	/** 
	 * constructor
	 * @param next
	 */
	public WeakFinnishStemmer(TermPipeline next) {
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
	    
	    for (int i = 0; i < len; i++)
	      switch(s[i]) {
	        case 'ä':
	        case 'å': s[i] = 'a'; break;
	        case 'ö': s[i] = 'o'; break;
	      }
	    
	    len = step1(s, len);
	    len = step2(s, len);
	    len = step3(s, len);
	    len = norm1(s, len);
	    len = norm2(s, len);
	    return len;
	  }
	  
	  private int step1(char s[], int len) {
	    if (len > 8) {
	      if (endsWith(s, len, "kin"))
	        return step1(s, len-3);
	      if (endsWith(s, len, "ko"))
	        return step1(s, len-2);
	    }
	    
	    if (len > 11) {
	      if (endsWith(s, len, "dellinen"))
	        return len-8;
	      if (endsWith(s, len, "dellisuus"))
	        return len-9;
	    }
	    return len;
	  }
	  
	  private int step2(char s[], int len) {
	    if (len > 5) {
	      if (endsWith(s, len, "lla")
	          || endsWith(s, len, "tse")
	          || endsWith(s, len, "sti"))
	        return len-3;
	      
	      if (endsWith(s, len, "ni"))
	        return len-2;
	      
	      if (endsWith(s, len, "aa"))
	        return len-1; // aa -> a
	    }
	    
	    return len;
	  }
	  
	  private int step3(char s[], int len) {
	    if (len > 8) {
	      if (endsWith(s, len, "nnen")) {
	        s[len-4] = 's';
	        return len-3;
	      }
	      
	      if (endsWith(s, len, "ntena")) {
	        s[len-5] = 's';
	        return len-4;
	      }
	      
	      if (endsWith(s, len, "tten"))
	        return len-4;
	      
	      if (endsWith(s, len, "eiden"))
	        return len-5;
	    }
	    
	    if (len > 6) {
	      if (endsWith(s, len, "neen")
	          || endsWith(s, len, "niin")
	          || endsWith(s, len, "seen")
	          || endsWith(s, len, "teen")
	          || endsWith(s, len, "inen"))
	          return len-4;
	      
	      if (s[len-3] == 'h' && isVowel(s[len-2]) && s[len-1] == 'n')
	        return len-3;
	      
	      if (endsWith(s, len, "den")) {
	        s[len-3] = 's';
	        return len-2;
	      }
	      
	      if (endsWith(s, len, "ksen")) {
	        s[len-4] = 's';
	        return len-3;
	      }
	      
	      if (endsWith(s, len, "ssa")
	          || endsWith(s, len, "sta")
	          || endsWith(s, len, "lla")
	          || endsWith(s, len, "lta")
	          || endsWith(s, len, "tta")
	          || endsWith(s, len, "ksi")
	          || endsWith(s, len, "lle"))
	        return len-3; 
	    }
	    
	    if (len > 5) {
	      if (endsWith(s, len, "na")
	          || endsWith(s, len, "ne"))
	        return len-2;
	      
	      if (endsWith(s, len, "nei"))
	        return len-3;
	    }
	    
	    if (len > 4) {
	      if (endsWith(s, len, "ja")
	          || endsWith(s, len, "ta"))
	        return len-2;
	      
	      if (s[len-1] == 'a')
	        return len-1;
	      
	      if (s[len-1] == 'n' && isVowel(s[len-2]))
	        return len-2;
	      
	      if (s[len-1] == 'n')
	        return len-1;
	    }
	    
	    return len;
	  }
	  
	  private int norm1(char s[], int len) {
	    if (len > 5 && endsWith(s, len, "hde")) {
	        s[len-3] = 'k';
	        s[len-2] = 's';
	        s[len-1] = 'i';
	    }
	    
	    if (len > 4) {
	      if (endsWith(s, len, "ei") || endsWith(s, len, "at"))
	        return len-2;
	    }
	    
	    if (len > 3)
	      switch(s[len-1]) {
	        case 't':
	        case 's':
	        case 'j':
	        case 'e':
	        case 'a':
	        case 'i': return len-1;
	      }
	    
	    return len;
	  }
	  
	  private int norm2(char s[], int len) {
	    if (len > 8) {
	      if (s[len-1] == 'e' 
	          || s[len-1] == 'o' 
	          || s[len-1] == 'u')
	        len--;
	    }
	    
	    if (len > 4) {
	      if (s[len-1] == 'i')
	        len--;
	      
	      if (len > 4) {
	        char ch = s[0];
	        for (int i = 1; i < len; i++) {
	          if (s[i] == ch &&
	              (ch == 'k' || ch == 'p' || ch == 't'))
	            len = delete(s, i--, len);
	          else
	            ch = s[i];
	        }
	      }
	    }
	    
	    return len;
	  }
	  
	  private boolean isVowel(char ch) {
	    switch(ch) {
	      case 'a':
	      case 'e':
	      case 'i':
	      case 'o':
	      case 'u':
	      case 'y': return true;
	      default: return false;
	    }
	  }
}
