%% Information
% 
% * *Author*: <mailto:ferro@dei.unipd.it Nicola Ferro>,
% <mailto:silvello@dei.unipd.it Gianmaria Silvello>
% * *Version*: 1.00
% * *Since*: 1.00
% * *Requirements*: Matlab 2013b or higher
% * *Copyright:* (C) 2013-2014 <http://ims.dei.unipd.it/ Information 
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

function calculateAndSaveMeasures(start, fin)

  common_parameters;

  measures = fieldnames(EXPERIMENT.measure);

  collections = fieldnames(COLLECTION);

  tot = size(collections, 1);

  if(tot < fin)
      fprintf('End index %1$d is bigger than the total %2$d. Exiting. \n\n', fin, tot);
      return
  end

  for i = start : fin
    
     collectionID = collections{i};
     
     fprintf('Processing: %s \n\n', collectionID);
     
     %import the pool
    serload(COLLECTIONS.path.pool(collectionID));
     
     %load the runSet
        serload(COLLECTIONS.path.runSet(collectionID));   
        
     if(~isdir(COLLECTIONS.path.measureSetDir(collectionID)))
         mkdir(COLLECTIONS.path.measureSetDir(collectionID));
     end
     
     for m = 1 : length(measures)
         % create the id of the measure
         measureID = COLLECTIONS.identifiers.measureId(collectionID, measures{m});
         var1 = 'var1';

         if(strcmp(measures{m}, 'twist'))
             fprintf('Calculating: %s \n\n', measures{m});
              % start time
              start = tic;
              % calculate the measure
              
              evalf(EXPERIMENT.measure.(measures{m}).command, ...
                      {COLLECTIONS.identifiers.pool(collectionID), COLLECTION.(collectionID).runSetId, 'measureID'}, ...
                      {var1, var1, var1, var1, var1, var1, measureID});
                 fprintf('\n\n>>>>>>>> Total elapsed time for calculating %s <<<<<<<<\n\n', ...
                measures{m}, elapsedToHourMinutesSeconds(toc(start)));    
              sersave(COLLECTIONS.path.measureSet(collectionID, measures{m}), COLLECTIONS.identifiers.measureId(collectionID, measures{m}));
         else
             fprintf('Calculating: %s', measures{m});
              % start time
              start = tic;
              % calculate the measure
              evalf(EXPERIMENT.measure.(measures{m}).command, ...
                      {COLLECTIONS.identifiers.pool(collectionID), COLLECTION.(collectionID).runSetId, 'measureID'}, ...
                      {measureID});
              fprintf('\n\n>>>>>>>> Total elapsed time for calculating %s <<<<<<<<\n\n', ...
                measures{m}, elapsedToHourMinutesSeconds(toc(start))); 
            sersave(COLLECTIONS.path.measureSet(collectionID, measures{m}), COLLECTIONS.identifiers.measureId(collectionID, measures{m}));
         end
         
     end
     
     
     
  end
end
