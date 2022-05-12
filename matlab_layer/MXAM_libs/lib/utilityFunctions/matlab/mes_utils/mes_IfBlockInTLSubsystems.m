% %test if a block belongs to a tl subsystem
%
% SYNTAX:
% =======
% ok=loc_ifBlockInTLSubsystems(hBlock,hTLsubs)
%
% DESCRIPTION:
% ============
% Test if a block belongs to one tl subsystem. A model can have more than
% one TL subsystems,if a block belongs to one of them, true will be
% returned.
%
% INPUT ARGUMENTS:
% ================
% -  hBlock          double (no default value)
%                    Handle of the block
% -  hTLsubs(option) handle of all tl subsystems of the model, can be
%                    empty, if empty, this function will get the tl
%                    subsystems
% RETURN VALUES:
% ==============
% -ok            true, if the block belongs to one tl subsystem
%                false, if the block does not belong to one tl subsystem or
%                no targetlink is installed.
% ****************************************************************
% Copyright:  Model Engineering Solutions
% Date:       $Date: 2020/07/31 16:10:01CEST $
% Revision:   $Rev: 5631 $
% ****************************************************************

function ok=mes_IfBlockInTLSubsystems(hBlock,hTLsubs)






















































