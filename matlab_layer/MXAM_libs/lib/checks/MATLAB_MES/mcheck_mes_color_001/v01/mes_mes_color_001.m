%% Coloration of Simulink/Stateflow-Models
%
% [result,cr_items,r_stats] = mes_mes_color_001(system, cmd_s)
%
% OUTPUT:
% =======
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
% r_stats   - struct with statistic s on the check result
% for details use 'open mes_check_info'
%
% INPUT:
% ======
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, 
% for details use 'open mes_check_info'
%
% DESCRIPTION:
% ============
% The coloration of all simulink-blocks and stateflow-objects is compared
% to regulations given in an external color scheme. 
%
% This color scheme is created as an m-file. The file name of this m-file
% is deposited in the MXAM parameter 'colorSchema'. See below (CHECK
% PARAMETERS) for a more detailed description of this color scheme or try
% 'help mxam_colorSchema_MES_simple'. 
%
% PASS/FAIL CRITERIA:
% ===================
% An element in a simulink model receives a fail if
% - the given color scheme treats this element AND
% - the regulations of the color scheme for this element are not fulfilled.
%
% SOLUTION:
% =========
% Choose the colors of simulink/stateflow elements according to the given
% color scheme
%
% FIX OPERATION:
% ==============
% The fix-option applies all regulations of the color scheme on the simulink 
% model and changes the corresponding properties of affected elements.
%
% CHECK PARAMETERS:
% =================
% MES.mes_color_001.colorSchema:
%   DATATYPE: 
%       string
%   DEFAULT VALUE:
%     'mxam_colorSchema_MES_Complex'
%   DESCRIPTION:
%       colorSchema is equal to the file name of the created color scheme.  
%       The output of this file is a struct which contains up to two fields.
%       Each field is a cell array:
%       a) a field to configurate simulink blocks and annotations
%       b) a field to configurate stateflow elements
%       '
%       a) 
%       Application:
%       ColorScheme.SL ={
%           'keyproperty','keyvalue','layoutprop1','layoutval1','layoutprop2','layoutval2';...
%           'keyproperty','keyvalue','layoutprop1','layoutval1','layoutprop2','layoutval2';...
%           'code','codestring','layoutprop1','layoutval1','layoutprop2','layoutval2';
%           ...
%       }
%       '
%       - each row in ColorScheme.SL represents a color scheme for a block/a
%         blocktype
%       - each row must have the same number of columns. If for one color 
%         scheme lesser specifications are used, 'top up' this row with 
%         empty columns
%       - 'keyproperty' and 'keyvalue' are used to identify a block/
%         blocktype
%       - 'layoutprop' and 'layoutval' represents pairs of valid 
%         property-value pairs for the block/blocktype determined by 
%         'keyproperty'/'keyvalue' 
%       - 'layoutval' can be an internal matlab color (i.e. white, black,
%         red...) or a custom made color, which is defined by its rgb 
%         representation. Enter these three numbers as a string which  
%         contains a matrix ('[r g b]'), i.e. '[255 255 0]'
%       - if 'keyproperty' is 'code', 'keyvalue' must be a string which can  
%         be evaluated and contains the keyword '#hblock'. This string will 
%         be evaluated at runtime, where #hblock represents the current 
%         object. This enables the creation of differentiated criterias for
%         blocks/blocktypes
%       '   
%       Example:
%       ColorScheme.SL ={
%           'BlockType','Inport','ForegroundColor','Black','BackgroundColor','green'; % consider Inports
%           'BlockType','Outport','ForegroundColor','Black','',''; % consider Outports
%           'code','strcmpi(get_param(#hBlock,''name''),''abc'')','ForegroundColor','[255 128 128]','BackgroundColor','blue' %consider all block which has the name 'abc'
%       }
%       ' 
%       b)
%       Application:
%       ColorScheme.SF ={
%           'keyword1', 'keyvalue1';
%           'keyword2', 'keyvalue2';
%           ...
%       }
%       '
%       - each row represents a color regulation for stateflow elements
%       - 'keyword' is used to identify stateflow elements. Supported keywords
%         are: 
%           ChartColor            BackgroundColor of chart
%           JunctionColor         ForeGroundColor of junctions
%           StateColor            ForeGroundColor of states(frame)
%           StateFontWeight       FontWeight of state labels
%           StateFontAngle        FontAngle of state labels
%           StateFontName         FontName of state labels
%           StateFontSize         FontSize of state labels
%           StateLabelColor       TextColor of state labels
%           TransitionColor       ForeGroundColor of transitions
%           TransitionFontWeight  FontWeight of transition labels
%           TransitionFontAngle   FontAngle of transition labels
%           TransitionFontName    FontName of transition labels
%           TransitionFontSize    FontSize of transition labels
%           TransitionLabelColor  TextColor of transition labels
%       - 'keyvalue' represents valid values for the corresponding 'keyword'. 
%          In the case of colors, one could use internal matlab colors  
%          (i.e. white, black, red...) or a custom made color, which is 
%          defined by its rgb  representation. Enter these three numbers as 
%          a string which contains a matrix ('[r g b]'), i.e. '[255 255 0]'
%       '
%       Example:
%       ColorScheme.SF ={...
%           'ChartColor',                      'white';
%           'JunctionColor',                   'brown';
%           'StateColor',                      'black';
%           'StateFontWeight',                 'normal';
%           'StateFontAngle',                  'normal';
%           'StateFontName',                   'Arial';
%           'StateFontSize',                   12;     
%           'StateLabelColor',                 'black';
%           'TransitionColor',                 'blue'; 
%           'TransitionFontWeight',            'normal';
%           'TransitionFontAngle',             'normal';
%           'TransitionFontName',              'Arial';
%           'TransitionFontSize',              12;     
%           'TransitionLabelColor',            'blue'...
%       };
%
% NOTE:
% =====
% In contrast to previous versions, global parameters 
% - ModelScreenColor
% - Block.BackgroundColor
% - Block.ForegroundColor
% - Annotation.BackgroundColor
% - Annotation.ForegroundColor
%
% are NO LONGER USED by this check. If the regulations should be used, they
% have to be entered in the colorscheme. One could use the following rows:
% 'Type','block_diagram','ScreenColor','white';...
% 'Type','block','ForegroundColor','black','BackgroundColor','white';...
% 'Type','annotation','ForegroundColor','black','BackgroundColor','white';...
%
% The row regarding simulink block properties has to be positioned ABOVE
% other lines regarding special simulink blocktypes. Otherwise these
% properties are overwritten. 
% The positions of the rows regarding annotations and model screen color
% do not depend on the other rows. 
%
% PUBLISHING INFORMATION
% *************************************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:03:52CEST $
% Revision:     $Rev: 6833 $
% *************************************************************************

function [result,cr_items,r_stats] = mes_mes_color_001(varargin)


















































