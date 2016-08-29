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

function importAndSaveCollections(start, fin)

common_parameters;

collections = fieldnames(COLLECTION);

tot = size(collections, 1);

if(tot < fin)
    sprintf('End index %1$d is bigger than the total %2$d. Exiting. ', fin, tot);
    return
end

for i = start : fin
   collectionID = collections{i};
   sprintf('%1$s%2$s', 'Processing: ', collectionID);
   collectionID 
  poolID = genvarname(COLLECTIONS.identifiers.pool(collectionID));

   %import the pool
   eval([poolID,'=EXPERIMENT.command.importPool(collectionID);']);
   
   %check if the path in the file system exists or create the path
   %otherwise
   if(~isdir(COLLECTIONS.path.poolDir(collectionID)))
       mkdir(COLLECTIONS.path.poolDir(collectionID));
   end
       
   sersave(COLLECTIONS.path.pool(collectionID), COLLECTIONS.identifiers.pool(collectionID));
   
  runsetID = genvarname(COLLECTION.(collectionID).runSetId);

      % start time
    start = tic;
  
   %import the runSet
   eval([runsetID,'=EXPERIMENT.command.importRunSet(collectionID);']);

   fprintf('\n\n>>>>>>>> Total elapsed time for importing the runSet for collection %s <<<<<<<<\n\n', ...
    collectionID, elapsedToHourMinutesSeconds(toc(start)));
  
   %check if the path in the file system exists or create the path
   %otherwise
   if(~isdir(COLLECTIONS.path.runSetDir(collectionID)))
       mkdir(COLLECTIONS.path.runSetDir(collectionID));
   end
  
   % start time
    start = tic;
    
   %save the runSet 
  sersave(COLLECTIONS.path.runSet(collectionID),COLLECTION.(collectionID).runSetId);

  fprintf('\n\n>>>>>>>> Total elapsed time for saving the runSet for collection %s <<<<<<<<\n\n', ...
    collectionID, elapsedToHourMinutesSeconds(toc(start)));
  
  clear COLLECTION.(collectionID).runSetId;
  
  
end
end
