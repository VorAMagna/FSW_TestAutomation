% Open or load a System (model) from a given path in a Secure way
%
% Open or load a simulink model (system) with a given name from a given
% path. Ensure that a possibly open model with the same name but from a
% different source/path is closed first. In the end the requested model
% is really open (and not another one with the same name, which was already
% open).
% The model can be opened (is visible - open_system) or loaded (in memory,
% but not visible - load_system).
% When the desired model is already open or loaded, nothing is done. This
% status (if the model was already open) is returned as output parameter.
%
% Syntax: ModelWasOpen = mes_OpenSystemSecure(ModelName, ModelPath, ModelOpenLoad, ModelSaveFlag)
%
% Input:
%   ModelName     - String containing name of the system to open/load
%   ModelPath     - (optional) String containing full path to the model file
%                   if NaN, Modelpath = '' is used
%   ModelOpenLoad - (optional) String containing method for open/load model
%                   'open': open the model - model visible (use open_system)
%                   'load': load the model - model not visible (use load_system)
%                   if omitted, empty or NaN, 'open' is used
%   ModelSaveFlag - (optional) Scalar defining the close mode without user interaction
%                   when model was changed
%                   This value is directly used for SAVEFLAG of close_system
%                   0: close changed model WITHOUT save
%                   1: close changed model WITH save
%                   if omitted, empty or NaN, 1 is used
%
% Output:
%   ModelWasOpen  - Scalar containing previous open status of the model
%                   0: model was not open/loaded
%                   1: model was already open/loaded
%                  -1: problem during model open (no model defined or model does not exist)
%
% Examples:
% % Open the demo model fuelsys (same as open_system)
% >> mes_OpenSystemSecure('fuelsys');
%
% % Load the demo model fuelsys in the background invisible
% >> mes_OpenSystemSecure('fuelsys', NaN, 'load');
%
% % Load the demo model fuelsys from a given path and return, if the model was already open/loaded
% >> ModelWasOpen = mes_OpenSystemSecure('fuelsys', 'C:\Programme\MATLABR2006b\toolbox\stateflow\sfdemos', 'load');
% ModelWasOpen = 1
%
% % Load the demo model fuelsys from another path and return, that the model was opened anew
% >> ModelWasOpen = mes_OpenSystemSecure('fuelsys', 'C:\temp\opentest');
% ModelWasOpen = 0
%
% % Open (standard) fuelsys
% % Afterward load the demo model fuelsys from another path and return,
% % that the model was opened anew, the first fuelsys is closed (and saved automatically)
% >> fuelsys
% >> ModelWasOpen = mes_OpenSystemSecure('fuelsys', 'C:\temp\opentest', 'open');
% ModelWasOpen = 0
%
% % Open (standard) fuelsys
% % Afterward load the demo model fuelsys from another path and return,
% % that the model was opened anew, the first fuelsys is closed (and NOT saved)
% >> fuelsys
% >> ModelWasOpen = mes_OpenSystemSecure('fuelsys', 'C:\temp\opentest', 'open', 0);
% ModelWasOpen = 0
%
% See also: MTest_CloseSystemSecure

function ModelWasOpen = mes_OpenSystemSecure(ModelName, ModelPath, ModelOpenLoad, ModelSaveFlag)




















































































































































