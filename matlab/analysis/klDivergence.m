%% klDivergence
% 
% Computes the Kullback-Leibler divergence among two probability
% distribution functions.

%% Synopsis
%
%   [kld] = klDivergence(q, vararging)
%  
%
% *Parameters*
%
% * *|x|* - the domain of the probability density functions.
% * *|varargin|* - the "true" / reference probability density functions;
% * *|q|* - the "approximate" probability density function.
%
% *Returns*
%
% * |kld|  - the Kullback-Leibler divergence D_KL(p || q).
% 
%% References
% 
% Please refer to:
%
% * Kullback, S. and Leibler, R. A. (1951). On Information and Sufficiency. _The Annals of Mathematical Statistics_, 22(1):79?86.

%% Information
% 
% * *Author*: <mailto:ferro@dei.unipd.it Nicola Ferro>,
% * *Version*: 1.00
% * *Since*: 1.00
% * *Requirements*: Matlab 2013b or higher
% * *Copyright:* (C) 2015 <http://ims.dei.unipd.it/ Information 
% Management Systems> (IMS) research group, <http://www.dei.unipd.it/ 
% Department of Information Engineering> (DEI), <http://www.unipd.it/ 
% University of Padua>, Italy
% * *License:* <http://www.apache.org/licenses/LICENSE-2.0 Apache License, 
% Version 2.0>

%%
%{
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
      http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
%}

function [kld] = klDivergence(x, q, varargin)

    % check that x is a numeric non empty vector
    validateattributes(x, {'numeric'}, {'nonempty', 'vector', 'real'}, '', 'x');

    % check that q is a positive non empty vector
    validateattributes(q, {'numeric'}, {'nonempty', 'vector', 'real', 'nonnegative'}, '', 'q');
        
    P = length(varargin);
    
    for pIdx = 1:P
        % check that p(i) is a positive non empty vector 
        validateattributes(varargin{pIdx}, {'numeric'}, {'nonempty', 'vector', 'real', 'nonnegative'}, '', 'p');
    end;
    
    kld = NaN(1, P);
    
    for pIdx = 1:P
        
        p = varargin{pIdx};
        
        tmp = p.*log(p./q);
        
        % remove cases where p is 0;
        tmp(isnan(tmp)) = 0;
                
        kld(pIdx) = trapz(x, tmp);
    end;
    
    if any(kld < 0)
        warning('Negative Kullback-Liebler divergences');
    end;
      
end

