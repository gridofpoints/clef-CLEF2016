%% common_parameters
% 
% Sets up parameters common to the different scripts.
%
%% Information
% 
% * *Author*: <mailto:silvello@dei.unipd.it Gianmaria Silvello>
% * *Version*: 1.00
% * *Since*: 1.00
% * *Requirements*: MATTERS 1.0 or higher; Matlab 2013b or higher
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

diary off;

%% General configuration

% if we are running on the cluster 
if (strcmpi(computer, 'GLNXA64'))
    addpath('/nas1/promise/ims/silvello/matters/')
    addpath('/nas1/promise/ims/silvello/matters/core/analysis/')
    addpath('/nas1/promise/ims/silvello/matters/core/io/')
    addpath('/nas1/promise/ims/silvello/matters/core/measure/')
    addpath('/nas1/promise/ims/silvello/matters/core/plot/')
    addpath('/nas1/promise/ims/silvello/matters/core/util/')
end;

% The base path
if (strcmpi(computer, 'GLNXA64'))
    % if we are running on the cloud 
    DATA.path.base = '/nas1/promise/ims/silvello/';
    EXPERIMENT.path.base =  sprintf('%1$s%2$s%3$s', DATA.path.base, ...
    'CLEF_hypercube', filesep);
    COLLECTIONS.path.base =  sprintf('%1$s%2$s%3$s', DATA.path.base, ...
    'experimental-collections', filesep);
else
    DATA.path.base = '/Users/silvello/Documents/research-projects/';
    EXPERIMENT.path.base =  sprintf('%1$s%2$s%3$s', DATA.path.base, ...
    'performance-data-cube', filesep);
    COLLECTIONS.path.base =  sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, ...
    'experimental-collections', filesep);
end;


EXPERIMENT.matlab.base = sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, ...
    'matlab', filesep); 

EXPERIMENT.matlab.runsets = sprintf('%1$s%2$s%3$s%4$s%5$s', EXPERIMENT.path.base, ...
    'matlab', filesep, 'runsets', filesep); 

EXPERIMENT.matlab.pools = sprintf('%1$s%2$s%3$s%4$s%5$s', EXPERIMENT.path.base, ...
    'matlab', filesep, 'pools', filesep); 

EXPERIMENT.matlab.measures = sprintf('%1$s%2$s%3$s%4$s%5$s', EXPERIMENT.path.base, ...
    'matlab', filesep, 'measures', filesep); 

% The path for logs
EXPERIMENT.path.log = sprintf('%1$s%2$s%3$s', EXPERIMENT.matlab.base, 'log', filesep);


% Label of the paper this experiment is for
EXPERIMENT.label.paper = 'TOIS 2016 FS';

% path of the runs
EXPERIMENT.path.runs = sprintf('%1$s%2$s%3$s', EXPERIMENT.path.base, 'runs', filesep);

%% configuration of collections

COLLECTION.AH_MONO_BG_CLEF2005.id = 'AH-MONO-BG-CLEF2005';
COLLECTION.AH_MONO_BG_CLEF2005.runSetId = 'runSet_AH_MONO_BG_CLEF2005';
COLLECTION.AH_MONO_BG_CLEF2005.track = 'AH-CLEF2005';
COLLECTION.AH_MONO_BG_CLEF2005.initiative = 'CLEF';
COLLECTION.AH_MONO_BG_CLEF2005.color = rgb('GreenYellow');
COLLECTION.AH_MONO_BG_CLEF2005.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_BG_CLEF2005.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_BG_CLEF2006.id = 'AH-MONO-BG-CLEF2006';
COLLECTION.AH_MONO_BG_CLEF2006.runSetId = 'runSet_AH_MONO_BG_CLEF2006';
COLLECTION.AH_MONO_BG_CLEF2006.track = 'AH-CLEF2006';
COLLECTION.AH_MONO_BG_CLEF2006.initiative = 'CLEF';
COLLECTION.AH_MONO_BG_CLEF2006.color = rgb('YellowGreen');
COLLECTION.AH_MONO_BG_CLEF2006.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_BG_CLEF2006.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_BG_CLEF2007.id = 'AH-MONO-BG-CLEF2007';
COLLECTION.AH_MONO_BG_CLEF2007.runSetId = 'runSet_AH_MONO_BG_CLEF2007';
COLLECTION.AH_MONO_BG_CLEF2007.track = 'AH-CLEF2007';
COLLECTION.AH_MONO_BG_CLEF2007.initiative = 'CLEF';
COLLECTION.AH_MONO_BG_CLEF2007.color = rgb('Chartreuse');
COLLECTION.AH_MONO_BG_CLEF2007.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_BG_CLEF2007.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_DE_CLEF2000.id = 'AH-MONO-DE-CLEF2000';
COLLECTION.AH_MONO_DE_CLEF2000.runSetId = 'runSet_AH_MONO_DE_CLEF2000';
COLLECTION.AH_MONO_DE_CLEF2000.track = 'AH-CLEF2000';
COLLECTION.AH_MONO_DE_CLEF2000.initiative = 'CLEF';
COLLECTION.AH_MONO_DE_CLEF2000.color = rgb('Black');
COLLECTION.AH_MONO_DE_CLEF2000.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_DE_CLEF2000.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_DE_CLEF2001.id = 'AH-MONO-DE-CLEF2001';
COLLECTION.AH_MONO_DE_CLEF2001.runSetId = 'runSet_AH_MONO_DE_CLEF2001';
COLLECTION.AH_MONO_DE_CLEF2001.track = 'AH-CLEF2001';
COLLECTION.AH_MONO_DE_CLEF2001.initiative = 'CLEF';
COLLECTION.AH_MONO_DE_CLEF2001.color = rgb('SlateGrey');
COLLECTION.AH_MONO_DE_CLEF2001.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_DE_CLEF2001.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_DE_CLEF2002.id = 'AH-MONO-DE-CLEF2002';
COLLECTION.AH_MONO_DE_CLEF2002.runSetId = 'runSet_AH-MONO-DE-CLEF2002';
COLLECTION.AH_MONO_DE_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_DE_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_DE_CLEF2002.color = rgb('DimGrey');
COLLECTION.AH_MONO_DE_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_DE_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_DE_CLEF2003.id = 'AH-MONO-DE-CLEF2003';
COLLECTION.AH_MONO_DE_CLEF2003.runSetId = 'runSet_AH_MONO_DE_CLEF2003';
COLLECTION.AH_MONO_DE_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_DE_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_DE_CLEF2003.color = rgb('DarkGrey');
COLLECTION.AH_MONO_DE_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_DE_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_TREC1996.id = 'AH-MONO-EN-TREC1996';
COLLECTION.AH_MONO_EN_TREC1996.runSetId = 'runSet_AH_MONO_EN_TREC1996';
COLLECTION.AH_MONO_EN_TREC1996.track = 'AH-TREC1996';
COLLECTION.AH_MONO_EN_TREC1996.initiative = 'TREC';
COLLECTION.AH_MONO_EN_TREC1996.color = rgb('Pink');
COLLECTION.AH_MONO_EN_TREC1996.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_TREC1996.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_TREC1997.id = 'AH-MONO-EN-TREC1997';
COLLECTION.AH_MONO_EN_TREC1997.runSetId = 'runSet_AH_MONO_EN_TREC1997';
COLLECTION.AH_MONO_EN_TREC1997.track = 'AH-TREC1997';
COLLECTION.AH_MONO_EN_TREC1997.initiative = 'TREC';
COLLECTION.AH_MONO_EN_TREC1997.color = rgb('Purple');
COLLECTION.AH_MONO_EN_TREC1997.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_TREC1997.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_TREC1998.id = 'AH-MONO-EN-TREC1998';
COLLECTION.AH_MONO_EN_TREC1998.runSetId = 'runSet_AH_MONO_EN_TREC1998';
COLLECTION.AH_MONO_EN_TREC1998.track = 'AH-TREC1998';
COLLECTION.AH_MONO_EN_TREC1998.initiative = 'TREC';
COLLECTION.AH_MONO_EN_TREC1998.color = rgb('DarkViolet');
COLLECTION.AH_MONO_EN_TREC1998.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_TREC1998.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_TREC1999.id = 'AH-MONO-EN-TREC1999';
COLLECTION.AH_MONO_EN_TREC1999.runSetId = 'runSet_AH_MONO_EN_TREC1999';
COLLECTION.AH_MONO_EN_TREC1999.track = 'AH-TREC1999';
COLLECTION.AH_MONO_EN_TREC1999.initiative = 'TREC';
COLLECTION.AH_MONO_EN_TREC1999.color = rgb('Indigo');
COLLECTION.AH_MONO_EN_TREC1999.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_TREC1999.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_ES_CLEF2001.id = 'AH-MONO-ES-CLEF2001';
COLLECTION.AH_MONO_ES_CLEF2001.runSetId = 'runSet_AH_MONO_ES_CLEF2001';
COLLECTION.AH_MONO_ES_CLEF2001.track = 'AH-CLEF2001';
COLLECTION.AH_MONO_ES_CLEF2001.initiative = 'CLEF';
COLLECTION.AH_MONO_ES_CLEF2001.color = rgb('Crimson');
COLLECTION.AH_MONO_ES_CLEF2001.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_ES_CLEF2001.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_ES_CLEF2002.id = 'AH-MONO-ES-CLEF2002';
COLLECTION.AH_MONO_ES_CLEF2002.runSetId = 'runSet_AH_MONO_ES_CLEF2002';
COLLECTION.AH_MONO_ES_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_ES_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_ES_CLEF2002.color = rgb('IndianRed');
COLLECTION.AH_MONO_ES_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_ES_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_ES_CLEF2003.id = 'AH-MONO-ES-CLEF2003';
COLLECTION.AH_MONO_ES_CLEF2003.runSetId = 'runSet_AH_MONO_ES_CLEF2003';
COLLECTION.AH_MONO_ES_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_ES_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_ES_CLEF2003.color = rgb('FireBrick');
COLLECTION.AH_MONO_ES_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_ES_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FI_CLEF2002.id = 'AH-MONO-FI-CLEF2002';
COLLECTION.AH_MONO_FI_CLEF2002.runSetId = 'runSet_AH_MONO_FI_CLEF2002';
COLLECTION.AH_MONO_FI_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_FI_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_FI_CLEF2002.color = rgb('PaleTurquoise');
COLLECTION.AH_MONO_FI_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FI_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FI_CLEF2003.id = 'AH-MONO-FI-CLEF2003';
COLLECTION.AH_MONO_FI_CLEF2003.runSetId = 'runSet_AH_MONO_FI_CLEF2003';
COLLECTION.AH_MONO_FI_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_FI_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_FI_CLEF2003.color = rgb('Turquoise');
COLLECTION.AH_MONO_FI_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FI_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FI_CLEF2004.id = 'AH-MONO-FI-CLEF2004';
COLLECTION.AH_MONO_FI_CLEF2004.runSetId = 'runSet_AH_MONO_FI_CLEF2004';
COLLECTION.AH_MONO_FI_CLEF2004.track = 'AH-CLEF2004';
COLLECTION.AH_MONO_FI_CLEF2004.initiative = 'CLEF';
COLLECTION.AH_MONO_FI_CLEF2004.color = rgb('DarkTurquoise');
COLLECTION.AH_MONO_FI_CLEF2004.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FI_CLEF2004.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2000.id = 'AH-MONO-FR-CLEF2000';
COLLECTION.AH_MONO_FR_CLEF2000.runSetId = 'runSet_AH_MONO_FR_CLEF2000';
COLLECTION.AH_MONO_FR_CLEF2000.track = 'AH-CLEF2000';
COLLECTION.AH_MONO_FR_CLEF2000.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2000.color = rgb('Blue');
COLLECTION.AH_MONO_FR_CLEF2000.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2000.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2001.id = 'AH-MONO-FR-CLEF2001';
COLLECTION.AH_MONO_FR_CLEF2001.runSetId = 'runSet_AH_MONO_FR_CLEF2001';
COLLECTION.AH_MONO_FR_CLEF2001.track = 'AH-CLEF2001';
COLLECTION.AH_MONO_FR_CLEF2001.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2001.color = rgb('DarkBlue');
COLLECTION.AH_MONO_FR_CLEF2001.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2001.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2002.id = 'AH-MONO-FR-CLEF2002';
COLLECTION.AH_MONO_FR_CLEF2002.runSetId = 'runSet_AH_MONO_FR_CLEF2002';
COLLECTION.AH_MONO_FR_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_FR_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2002.color = rgb('MediumBlue');
COLLECTION.AH_MONO_FR_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2003.id = 'AH-MONO-FR-CLEF2003';
COLLECTION.AH_MONO_FR_CLEF2003.runSetId = 'runSet_AH_MONO_FR_CLEF2003';
COLLECTION.AH_MONO_FR_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_FR_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2003.color = rgb('RoyalBlue');
COLLECTION.AH_MONO_FR_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2004.id = 'AH-MONO-FR-CLEF2004';
COLLECTION.AH_MONO_FR_CLEF2004.runSetId = 'runSet_AH_MONO_FR_CLEF2004';
COLLECTION.AH_MONO_FR_CLEF2004.track = 'AH-CLEF2004';
COLLECTION.AH_MONO_FR_CLEF2004.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2004.color = rgb('CornflowerBlue');
COLLECTION.AH_MONO_FR_CLEF2004.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2004.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2005.id = 'AH-MONO-FR-CLEF2005';
COLLECTION.AH_MONO_FR_CLEF2005.runSetId = 'runSet_AH_MONO_FR_CLEF2005';
COLLECTION.AH_MONO_FR_CLEF2005.track = 'AH-CLEF2005';
COLLECTION.AH_MONO_FR_CLEF2005.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2005.color = rgb('DodgerBlue');
COLLECTION.AH_MONO_FR_CLEF2005.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2005.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_FR_CLEF2006.id = 'AH-MONO-FR-CLEF2006';
COLLECTION.AH_MONO_FR_CLEF2006.runSetId = 'runSet_AH_MONO_FR_CLEF2006';
COLLECTION.AH_MONO_FR_CLEF2006.track = 'AH-CLEF2006';
COLLECTION.AH_MONO_FR_CLEF2006.initiative = 'CLEF';
COLLECTION.AH_MONO_FR_CLEF2006.color = rgb('MidnightBlue');
COLLECTION.AH_MONO_FR_CLEF2006.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_FR_CLEF2006.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_HU_CLEF2005.id = 'AH-MONO-HU-CLEF2005';
COLLECTION.AH_MONO_HU_CLEF2005.runSetId = 'runSet_AH_MONO_HU_CLEF2005';
COLLECTION.AH_MONO_HU_CLEF2005.track = 'AH-CLEF2005';
COLLECTION.AH_MONO_HU_CLEF2005.initiative = 'CLEF';
COLLECTION.AH_MONO_HU_CLEF2005.color = rgb('Orchid');
COLLECTION.AH_MONO_HU_CLEF2005.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_HU_CLEF2005.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_HU_CLEF2006.id = 'AH-MONO-HU-CLEF2006';
COLLECTION.AH_MONO_HU_CLEF2006.runSetId = 'runSet_AH_MONO_HU_CLEF2006';
COLLECTION.AH_MONO_HU_CLEF2006.track = 'AH-CLEF2006';
COLLECTION.AH_MONO_HU_CLEF2006.initiative = 'CLEF';
COLLECTION.AH_MONO_HU_CLEF2006.color = rgb('DarkOrchid');
COLLECTION.AH_MONO_HU_CLEF2006.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_HU_CLEF2006.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_HU_CLEF2007.id = 'AH-MONO-HU-CLEF2007';
COLLECTION.AH_MONO_HU_CLEF2007.runSetId = 'runSet_AH_MONO_HU_CLEF2007';
COLLECTION.AH_MONO_HU_CLEF2007.track = 'AH-CLEF2007';
COLLECTION.AH_MONO_HU_CLEF2007.initiative = 'CLEF';
COLLECTION.AH_MONO_HU_CLEF2007.color = rgb('Violet');
COLLECTION.AH_MONO_HU_CLEF2007.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_HU_CLEF2007.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_IT_CLEF2000.id = 'AH-MONO-IT-CLEF2000';
COLLECTION.AH_MONO_IT_CLEF2000.runSetId = 'runSet_AH_MONO_IT_CLEF2000';
COLLECTION.AH_MONO_IT_CLEF2000.track = 'AH-CLEF2000';
COLLECTION.AH_MONO_IT_CLEF2000.initiative = 'CLEF';
COLLECTION.AH_MONO_IT_CLEF2000.color = rgb('DeepSkyBlue');
COLLECTION.AH_MONO_IT_CLEF2000.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_IT_CLEF2000.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_IT_CLEF2001.id = 'AH-MONO-IT-CLEF2001';
COLLECTION.AH_MONO_IT_CLEF2001.runSetId = 'runSet_AH_MONO_IT_CLEF2001';
COLLECTION.AH_MONO_IT_CLEF2001.track = 'AH-CLEF2001';
COLLECTION.AH_MONO_IT_CLEF2001.initiative = 'CLEF';
COLLECTION.AH_MONO_IT_CLEF2001.color = rgb('SkyBlue');
COLLECTION.AH_MONO_IT_CLEF2001.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_IT_CLEF2001.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_IT_CLEF2002.id = 'AH-MONO-IT-CLEF2002';
COLLECTION.AH_MONO_IT_CLEF2002.runSetId = 'runSet_AH_MONO_IT_CLEF2002';
COLLECTION.AH_MONO_IT_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_IT_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_IT_CLEF2002.color = rgb('LightSkyBlue');
COLLECTION.AH_MONO_IT_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_IT_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_IT_CLEF2003.id = 'AH-MONO-IT-CLEF2003';
COLLECTION.AH_MONO_IT_CLEF2003.runSetId = 'runSet_AH_MONO_IT_CLEF2003';
COLLECTION.AH_MONO_IT_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_IT_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_IT_CLEF2003.color = rgb('SteelBlue');
COLLECTION.AH_MONO_IT_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_IT_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_PT_CLEF2004.id = 'AH-MONO-PT-CLEF2004';
COLLECTION.AH_MONO_PT_CLEF2004.runSetId = 'runSet_AH_MONO_PT_CLEF2004';
COLLECTION.AH_MONO_PT_CLEF2004.track = 'AH-CLEF2004';
COLLECTION.AH_MONO_PT_CLEF2004.initiative = 'CLEF';
COLLECTION.AH_MONO_PT_CLEF2004.color = rgb('Green');
COLLECTION.AH_MONO_PT_CLEF2004.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_PT_CLEF2004.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_PT_CLEF2005.id = 'AH-MONO-PT-CLEF2005';
COLLECTION.AH_MONO_PT_CLEF2005.runSetId = 'runSet_AH_MONO_PT_CLEF2005';
COLLECTION.AH_MONO_PT_CLEF2005.track = 'AH-CLEF2005';
COLLECTION.AH_MONO_PT_CLEF2005.initiative = 'CLEF';
COLLECTION.AH_MONO_PT_CLEF2005.color = rgb('LawnGreen');
COLLECTION.AH_MONO_PT_CLEF2005.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_PT_CLEF2005.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_PT_CLEF2006.id = 'AH-MONO-PT-CLEF2006';
COLLECTION.AH_MONO_PT_CLEF2006.runSetId = 'runSet_AH_MONO_PT_CLEF2006';
COLLECTION.AH_MONO_PT_CLEF2006.track = 'AH-CLEF2006';
COLLECTION.AH_MONO_PT_CLEF2006.initiative = 'CLEF';
COLLECTION.AH_MONO_PT_CLEF2006.color = rgb('Lime');
COLLECTION.AH_MONO_PT_CLEF2006.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_PT_CLEF2006.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_RU_CLEF2003.id = 'AH-MONO-RU-CLEF2003';
COLLECTION.AH_MONO_RU_CLEF2003.runSetId = 'runSet_AH_MONO_RU_CLEF2003';
COLLECTION.AH_MONO_RU_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_RU_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_RU_CLEF2003.color = rgb('Maroon');
COLLECTION.AH_MONO_RU_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_RU_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_RU_CLEF2004.id = 'AH-MONO-RU-CLEF2004';
COLLECTION.AH_MONO_RU_CLEF2004.runSetId = 'runSet_AH_MONO_RU_CLEF2004';
COLLECTION.AH_MONO_RU_CLEF2004.track = 'AH-CLEF2004';
COLLECTION.AH_MONO_RU_CLEF2004.initiative = 'CLEF';
COLLECTION.AH_MONO_RU_CLEF2004.color = rgb('Sienna');
COLLECTION.AH_MONO_RU_CLEF2004.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_RU_CLEF2004.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_SV_CLEF2002.id = 'AH-MONO-SV-CLEF2002';
COLLECTION.AH_MONO_SV_CLEF2002.runSetId = 'runSet_AH_MONO_SV_CLEF2002';
COLLECTION.AH_MONO_SV_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_SV_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_SV_CLEF2002.color = rgb('Gold');
COLLECTION.AH_MONO_SV_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_SV_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_SV_CLEF2003.id = 'AH-MONO-SV-CLEF2003';
COLLECTION.AH_MONO_SV_CLEF2003.runSetId = 'runSet_AH_MONO_SV_CLEF2003';
COLLECTION.AH_MONO_SV_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_SV_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_SV_CLEF2003.color = rgb('Khaki');
COLLECTION.AH_MONO_SV_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_SV_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_CS_CLEF2007.id = 'AH-MONO-CS-CLEF2007';
COLLECTION.AH_MONO_CS_CLEF2007.runSetId = 'runSet_AH_MONO_CS_CLEF2007';
COLLECTION.AH_MONO_CS_CLEF2007.track = 'AH-CLEF2007';
COLLECTION.AH_MONO_CS_CLEF2007.initiative = 'CLEF';
COLLECTION.AH_MONO_CS_CLEF2007.color = rgb('Khaki');
COLLECTION.AH_MONO_CS_CLEF2007.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_CS_CLEF2007.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2000.id = 'AH-MONO-EN-CLEF2000';
COLLECTION.AH_MONO_EN_CLEF2000.runSetId = 'runSet_AH_MONO_EN_CLEF2000';
COLLECTION.AH_MONO_EN_CLEF2000.track = 'AH-CLEF2000';
COLLECTION.AH_MONO_EN_CLEF2000.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2000.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2000.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2000.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2001.id = 'AH-MONO-EN-CLEF2001';
COLLECTION.AH_MONO_EN_CLEF2001.runSetId = 'runSet_AH_MONO_EN_CLEF2001';
COLLECTION.AH_MONO_EN_CLEF2001.track = 'AH-CLEF2001';
COLLECTION.AH_MONO_EN_CLEF2001.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2001.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2001.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2001.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2002.id = 'AH-MONO-EN-CLEF2002';
COLLECTION.AH_MONO_EN_CLEF2002.runSetId = 'runSet_AH_MONO_EN_CLEF2002';
COLLECTION.AH_MONO_EN_CLEF2002.track = 'AH-CLEF2002';
COLLECTION.AH_MONO_EN_CLEF2002.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2002.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2002.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2002.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2003.id = 'AH-MONO-EN-CLEF2003';
COLLECTION.AH_MONO_EN_CLEF2003.runSetId = 'runSet_AH_MONO_EN_CLEF2003';
COLLECTION.AH_MONO_EN_CLEF2003.track = 'AH-CLEF2003';
COLLECTION.AH_MONO_EN_CLEF2003.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2003.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2003.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2003.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2004.id = 'AH-MONO-EN-CLEF2004';
COLLECTION.AH_MONO_EN_CLEF2004.runSetId = 'runSet_AH_MONO_EN_CLEF2004';
COLLECTION.AH_MONO_EN_CLEF2004.track = 'AH-CLEF2004';
COLLECTION.AH_MONO_EN_CLEF2004.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2004.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2004.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2004.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2005.id = 'AH-MONO-EN-CLEF2005';
COLLECTION.AH_MONO_EN_CLEF2005.runSetId = 'runSet_AH_MONO_EN_CLEF2005';
COLLECTION.AH_MONO_EN_CLEF2005.track = 'AH-CLEF2005';
COLLECTION.AH_MONO_EN_CLEF2005.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2005.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2005.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2005.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2006.id = 'AH-MONO-EN-CLEF2006';
COLLECTION.AH_MONO_EN_CLEF2006.runSetId = 'runSet_AH_MONO_EN_CLEF2006';
COLLECTION.AH_MONO_EN_CLEF2006.track = 'AH-CLEF2006';
COLLECTION.AH_MONO_EN_CLEF2006.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2006.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2006.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2006.RelevanceGrades = 0:1;

COLLECTION.AH_MONO_EN_CLEF2007.id = 'AH-MONO-EN-CLEF2007';
COLLECTION.AH_MONO_EN_CLEF2007.runSetId = 'runSet_AH_MONO_EN_CLEF2007';
COLLECTION.AH_MONO_EN_CLEF2007.track = 'AH-CLEF2007';
COLLECTION.AH_MONO_EN_CLEF2007.initiative = 'CLEF';
COLLECTION.AH_MONO_EN_CLEF2007.color = rgb('Khaki');
COLLECTION.AH_MONO_EN_CLEF2007.RelevanceDegrees = {'NotRelevant', 'Relevant'};
COLLECTION.AH_MONO_EN_CLEF2007.RelevanceGrades = 0:1;


COLLECTIONS.path.runs = @(collectionID) sprintf('%1$s%2$s%3$s%4$s%5$s%6$s%7$s', EXPERIMENT.path.base, 'runs', filesep, COLLECTION.(collectionID).track, filesep, COLLECTION.(collectionID).id, filesep);

COLLECTIONS.path.qrels = @(collectionID) sprintf('%1$s%2$s%3$s%4$s%5$s%6$s%7$s%8$s%9$s', COLLECTIONS.path.base, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track, filesep, 'pool', filesep, COLLECTION.(collectionID).id, '.txt');

COLLECTIONS.path.runSetDir = @(collectionID) sprintf('%1$s%2$s%3$s%4$s', EXPERIMENT.matlab.runsets, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track);

COLLECTIONS.path.poolDir = @(collectionID) sprintf('%1$s%2$s%3$s%4$s', EXPERIMENT.matlab.pools, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track);

COLLECTIONS.path.runSet = @(collectionID) sprintf('%1$s%2$s%3$s%4$s%5$s%6$s%7$s', EXPERIMENT.matlab.runsets, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track, filesep, COLLECTION.(collectionID).id, '.mat');

COLLECTIONS.path.pool = @(collectionID) sprintf('%1$s%2$s%3$s%4$s%5$s%6$s%7$s', EXPERIMENT.matlab.pools, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track, filesep, COLLECTION.(collectionID).id, '.mat');

COLLECTIONS.identifiers.pool = @(collectionID)  sprintf('%1$s%2$s', 'pool_', collectionID);

COLLECTIONS.identifiers.measureId = @(collectionID, measureShortName)  sprintf('%1$s%2$s%3$s', measureShortName, '_', collectionID);

COLLECTIONS.path.measureSet = @(collectionID, measureShortName) sprintf('%1$s%2$s%3$s%4$s%5$s%6$s%7$s', EXPERIMENT.matlab.measures, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track, filesep, COLLECTIONS.identifiers.measureId(collectionID, measureShortName), '.mat');

COLLECTIONS.path.measureSetDir = @(collectionID) sprintf('%1$s%2$s%3$s%4$s', EXPERIMENT.matlab.measures, COLLECTION.(collectionID).initiative, filesep, COLLECTION.(collectionID).track);


%% COMMANDS
% import a pool from file
EXPERIMENT.command.importPool = @(collectionID) importPoolFromFileTRECFormat('FileName', COLLECTIONS.path.qrels(collectionID), 'Identifier', COLLECTIONS.identifiers.pool(collectionID), 'RelevanceDegrees', COLLECTION.(collectionID).RelevanceDegrees, 'RelevanceGrades', COLLECTION.(collectionID).RelevanceGrades, 'Delimiter', 'space',  'Verbose', false);

% import a runSet from a directory containing the run files as text files
EXPERIMENT.command.importRunSet = @(collectionID) importRunsFromDirectoryTRECFormat('Path', COLLECTIONS.path.runs(collectionID), 'Identifier', COLLECTION.(collectionID).runSetId, 'DocumentOrdering', 'TrecEvalLexDesc', 'SinglePrecision', true, 'Verbose', false, 'Delimiter', 'space');

% save a measureSet in the right path
EXPERIMENT.command.saveMeasureSet = @(collectionID, measureShortName) sersave(COLLECTIONS.path.measureSet(collectionID, measureShortName), COLLECTIONS.identifiers.measureId(collectionID, measureShortName));

% load a pool 
EXPERIMENT.command.loadPool = @(collectionID) serload(COLLECTIONS.path.pool(collectionID));

% load a runset 
EXPERIMENT.command.loadRunSet = @(collectionID) serload(COLLECTIONS.path.runSet(collectionID));

% load a measureSet 
EXPERIMENT.command.loadMeasureSet = @(collectionID, measureShortName) serload(COLLECTIONS.path.measureSet(collectionID, measureShortName));

%% Configuration for measures
MEASURE.measures = {'ap', 'p10', 'rprec', 'rbp', 'ndcg20', 'ndcg', 'err20', 'err', 'twist'};

EXPERIMENT.measure.ap.shortName = 'ap';
EXPERIMENT.measure.ap.name = 'AP';
EXPERIMENT.measure.ap.fullName = 'Average Precision (AP)';
EXPERIMENT.measure.ap.command = @(pool, runSet, shortNameSuffix) averagePrecision(pool, runSet, 'ShortNameSuffix', shortNameSuffix);

EXPERIMENT.measure.rbp.shortName = 'rbp';
EXPERIMENT.measure.rbp.name = 'RBP';
EXPERIMENT.measure.rbp.fullName = 'Rank-biased Precision (RBP)';
EXPERIMENT.measure.rbp.persistence = 0.8;
EXPERIMENT.measure.rbp.command = @(pool, runSet, shortNameSuffix) rankBiasedPrecision(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'Persistence', EXPERIMENT.measure.rbp.persistence);

EXPERIMENT.measure.p10.shortName = 'p10';
EXPERIMENT.measure.p10.name = 'P10';
EXPERIMENT.measure.p10.fullName = 'Precision@10';
EXPERIMENT.measure.p10.cutoffs = 10;
EXPERIMENT.measure.p10.command = @(pool, runSet, shortNameSuffix) precision(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.p10.cutoffs);

EXPERIMENT.measure.rprec.shortName = 'rprec';
EXPERIMENT.measure.rprec.name = 'Rprec';
EXPERIMENT.measure.rprec.fullName = 'Rprec';
EXPERIMENT.measure.rprec.command = @(pool, runSet, shortNameSuffix) precision(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'RPrec', true);

EXPERIMENT.measure.ndcg20.shortName = 'ndcg20';
EXPERIMENT.measure.ndcg20.name = 'nDCG@20';
EXPERIMENT.measure.ndcg20.fullName = 'Normalized Discounted Cumulated Gain (nDCG) @ 20';
EXPERIMENT.measure.ndcg20.cutoffs = 20;
EXPERIMENT.measure.ndcg20.command = @(pool, runSet, shortNameSuffix) discountedCumulatedGain(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.ndcg20.cutoffs, 'Normalize', true, 'FixNumberRetrievedDocuments', 1000, 'FixedNumberRetrievedDocumentsPaddingStrategy', 'NotRelevant');

EXPERIMENT.measure.ndcg.shortName = 'ndcg';
EXPERIMENT.measure.ndcg.name = 'nDCG@LRR';
EXPERIMENT.measure.ndcg.fullName = 'Normalized Discounted Cumulated Gain (nDCG)';
EXPERIMENT.measure.ndcg.cutoffs = 'LastRelevantRetrieved';
EXPERIMENT.measure.ndcg.command = @(pool, runSet, shortNameSuffix) discountedCumulatedGain(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.ndcg.cutoffs, 'Normalize', true, 'FixNumberRetrievedDocuments', 1000, 'FixedNumberRetrievedDocumentsPaddingStrategy', 'NotRelevant');

EXPERIMENT.measure.err20.shortName = 'err20';
EXPERIMENT.measure.err20.name = 'ERR@20';
EXPERIMENT.measure.err20.fullName = 'Expected Reciprocal Rank (ERR)';
EXPERIMENT.measure.err20.cutoffs = 20;
EXPERIMENT.measure.err20.command = @(pool, runSet, shortNameSuffix) expectedReciprocalRank(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.err20.cutoffs, 'FixNumberRetrievedDocuments', 1000, 'FixedNumberRetrievedDocumentsPaddingStrategy', 'NotRelevant');

EXPERIMENT.measure.err.shortName = 'err';
EXPERIMENT.measure.err.name = 'ERR@LRR';
EXPERIMENT.measure.err.fullName = 'Expected Reciprocal Rank (ERR)';
EXPERIMENT.measure.err.cutoffs = 'LastRelevantRetrieved';
EXPERIMENT.measure.err.command = @(pool, runSet, shortNameSuffix) expectedReciprocalRank(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'CutOffs', EXPERIMENT.measure.err.cutoffs, 'FixNumberRetrievedDocuments', 1000, 'FixedNumberRetrievedDocumentsPaddingStrategy', 'NotRelevant');

EXPERIMENT.measure.twist.shortName = 'twist';
EXPERIMENT.measure.twist.name = 'Twist';
EXPERIMENT.measure.twist.fullName = 'Twist';
EXPERIMENT.measure.twist.command = @(pool, runSet, shortNameSuffix) cumulatedRelativePosition(pool, runSet, 'ShortNameSuffix', shortNameSuffix, 'FixNumberRetrievedDocuments', 1000, 'FixedNumberRetrievedDocumentsPaddingStrategy', 'NotRelevant');