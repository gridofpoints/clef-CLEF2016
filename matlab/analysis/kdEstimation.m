%% klDivergence
% 
% Computes the kernel density estimation of the PDF of sample data.

%% Synopsis
%
%   [pdf] = kdEstimation(x, xi, b)
%  
%
% *Parameters*
%
% * *|x|* - the sample data;
% * *|xi|* - the points at which the PDF must be estimated.
% * *|b|* - the bandwidth to use.
%
% *Returns*
%
% * |pdf|  - the estimation of the PDF
% 
%% References
% 
% Please refer to:
%
% * Bowman, A. W., and A. Azzalini (1997). _Applied Smoothing Techniques for Data Analysis_. Oxford University Press Inc, New York, USA. 

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

function [pdf] = kdEstimation(x, xi, b)

    % check that x is a numeric non empty vector
    validateattributes(x, {'numeric'}, {'nonempty', 'vector', 'real'}, '', 'x');
    
    % check that xi is a numeric non empty vector
    validateattributes(xi, {'numeric'}, {'nonempty', 'vector', 'real'}, '', 'xi');
    
    % check that b is a numeric non empty scalar
    validateattributes(b, {'numeric'}, {'nonempty', 'scalar', 'real'}, '', 'b');

    % estimate the PDF
    pdf =  ksdensity(x, xi, 'bandwidth', b, 'function', 'pdf');
      
    % check that the PDF sums up almost to 1
    area = trapz(xi, pdf);
    if  area < 0.99
        warning('The integral of the PDF is %d', area);
    end;     
end

