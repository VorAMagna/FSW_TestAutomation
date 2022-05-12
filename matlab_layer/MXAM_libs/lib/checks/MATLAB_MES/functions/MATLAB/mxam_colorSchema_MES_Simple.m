% The output of this file is a struct which contains up to two fields. Each 
% field is a cell array:
% a) a field to configurate simulink blocks and annotations
% b) a field to configurate stateflow elements
%
% a) 
% Application:
% ColorScheme.SL ={
%'keyproperty','keyvalue','layoutprop1','layoutval1','layoutprop2','layoutval2';...
%'keyproperty','keyvalue','layoutprop1','layoutval1','layoutprop2','layoutval2';...
%'code','codestring','layoutprop1','layoutval1','layoutprop2','layoutval2';
% ...
% }
% 
% - each row in ColorScheme.SL represents a colorscheme for a block/a
%   blocktype
% - each row must have the same number of columns. If for one colorscheme
%   lesser specifications are used, 'top up' thisrow with empty columns
% - 'keyproperty' and 'keyvalue' are used ti identifiy a block/blocktype
% - 'layoutprop' and 'layoutval' represents pairs of valid property-value
%   pairs for the block/blocktype determined by 'keyproperty'/'keyvalue' 
% - 'layoutval' can be a internal matlab color (i.e. white, black,
%   red...) or a custom made color, which is defined by its rgb 
%   representation. Enter this three numbers as a string which contains a 
%   matrix ('[r g b]'), i.e. '[255 255 0]'
% - if 'keyproperty' is 'code', 'keyvalue' must be a string which is
%   evaluable and contains the keyword '#hblock'. This string will be
%   evaluated at runtime, where #hblock represents the current object. This
%   gives the possibility to create differentiated criterias for
%   blocks/blocktypes
%   
% Example:
% ColorScheme.SL ={
%   'BlockType','Inport','ForegroundColor','Black','BackgroundColor','green'; % consider Inports
%   'BlockType','Outport','ForegroundColor','Black','',''; % consider Outports
%   'code','strcmpi(get_param(#hBlock,''name''),''abc'')','ForegroundColor','[255 128 128]','BackgroundColor','blue' %consider all block which has the name 'abc'
% }
% 
% b)
% Application:
% ColorScheme.SF ={
% 'keyword1', 'keyvalue1';
% 'keyword2', 'keyvalue2';
% ...
% }
%
% - each ro represents a colorregulation for stateflow elements
% - 'keyword' is used to identify stateflow elements. Supported keywords
%   are: 
%       ChartColor            BackgroundColor of chart
%       JunctionColor         ForeGroundColor of junctions
%       StateColor            ForeGroundColor of states(frame)
%       StateFontWeight       FontWeight of state labels
%       StateFontAngle        FontAngle of state labels
%       StateFontName         FontName of state labels
%       StateFontSize         FontSize of state labels
%       StateLabelColor       TextColor of state labels
%       TransitionColor       ForeGroundColor of transitions
%       TransitionFontWeight  FontWeight of transition labels
%       TransitionFontAngle   FontAngle of transition labels
%       TransitionFontName    FontName of transition labels
%       TransitionFontSize    FontSize of transition labels
%       TransitionLabelColor  TextColor of transition labels
% - 'keyvalue' represents valid values for the corresponding 'keyword'. In
%   the case of colors, one could use internal matlab colors (i.e. white, 
%   black, red...) or a custom made color, which is defined by its rgb 
%   representation. Enter this three numbers as a string which contains a 
%   matrix ('[r g b]'), i.e. '[255 255 0]'
%
% Example:
% ColorScheme.SF ={...
%   'ChartColor',                      'white';
%   'JunctionColor',                   'brown';
%   'StateColor',                      'black';
%   'StateFontWeight',                 'normal';
%   'StateFontAngle',                  'normal';
%   'StateFontName',                   'Arial';
%   'StateFontSize',                   12;     
%   'StateLabelColor',                 'black';
%   'TransitionColor',                 'blue'; 
%   'TransitionFontWeight',            'normal';
%   'TransitionFontAngle',             'normal';
%   'TransitionFontName',              'Arial';
%   'TransitionFontSize',              12;     
%   'TransitionLabelColor',            'blue'...
% };
% ------------------------------------------------------------------------------
function colorSchema=mxam_colorSchema_MES_Simple
colorSchema={...
            % general rules model-,block- and annotations. 
            % comment these lines, if you do not want to use general rules.            
            'Type','block_diagram','ScreenColor','white','','';...
            'Type','block','ForegroundColor','black','BackgroundColor','white';
            'Type','Annotation','ForegroundColor','black','BackgroundColor','white'...          
            % rules for special blocktypes
            'BlockType','Inport','BackgroundColor','green','','';...
            'MaskType','TL_Inport','BackgroundColor','green','','';...
            %remove the goto and from to avoid conflict with
            %misra_slsf_026_ab
            %'BlockType','From','BackgroundColor','[128 255 128]','','';...
            'BlockType','DataStoreRead','BackgroundColor','[0 160 0]','','';...
            'MaskType', 'TL_DataStoreRead','BackgroundColor','[0 160 0]','','';...
            'BlockType','Ground,Terminator','BackgroundColor','gray','','';...
            'BlockType','DataStoreWrite','BackgroundColor','[160 0 0]','','';...
            'BlockType','DataStoreMemory','BackgroundColor','[160 0 160]','','';...
            'BlockType','outport','BackgroundColor','[255 66 66]','','';...
            'MaskType', 'TL_Outport','BackgroundColor','[255 66 66]','','';...
            %'BlockType','Goto','BackgroundColor','[255 128 128]','','';...
            'BlockType','Constant','BackgroundColor','lightBlue','','';...
            'BlockType','S-Function','BackgroundColor','[128 128 255]','','';...
            'MaskType','CMBlock,DocBlock','BackgroundColor','[255 255 128]','','';...
            'BlockType','If,SwitchCase,Merge','BackgroundColor','orange','','';...
            'BlockType','SignalSpecification,DataTypeConversion','BackgroundColor','[224 224 224]','','';...
            'MaskType','Stateflow','BackgroundColor','[255 255 0]','','';...
            'BlockType','TriggerPort','BackgroundColor','magenta','','';...
            'MaskType','Function-Call Generator','BackgroundColor','magenta','','';...
            'code','mxam_subsystemsWithColor(#hBlock)','BackgroundColor','[128 255 255]','',''      
            };
