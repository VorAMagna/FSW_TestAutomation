% MES check: ds_0082 - Comments in Block Properties
%
% function [result,cr_items,r_stats] = mes_ds_0082(system, cmd_s)
%
% RETURN PARAMETERS:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items 
%
% INPUT PARAMETERS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK: 
% ==========
% ds_0082 - Comments in Block Properties
%
% All comments provided in the description field of blocks should be valid 
% ANSI C comments without the enclosing /* and /* symbols. 
% In particular, this rules out the use of /* and */ as well as 
% German umlaute and special characters.
%
% The rule ensures that comments on the block level can be transformed into
% valid C comments.
%
% The C language standard specifies a minimum character set. 
% The handling of any characters outside this basic set will 
% amount to implementation defined behaviour. 
% The basic set consists of the following characters: 
%
% Letters:
%        A  B  C  D  E  F  G  H  I  J  K  L  M
%        N  O  P  Q  R  S  T  U  V  W  X  Y  Z
%        a  b  c  d  e  f  g  h  i  j  k  l  m
%        n  o  p  q  r  s  t  u  v  w  x  y  z
% 
% Decimal digits
%        0  1  2  3  4  5  6  7  8  9
% 
% Graphic characters
%        !  "  #  %  &  '  (  )  *  +  ,  -  .  /  :
%        ;  <  =  >  ?  [  \  ]  ^  _  {  |  }  ~
% 
% Others
%        Space character
%        Horizontal tab
%        Vertical tab
%        Form feed
%
% 
% PASS Criteria:
% ==============
% Each block or subsystem whose comments in the block description field
% consist only of characters of the basic character set will receive a pass.
%
% FAIL criteria:
% ==============
% Each block or subsystem whose comments in the block description field
% consist of other characters than of the basic character set 
% will receive a fail.
%
% Find all blocks with invalid characters in the description field
% Allowed characters are of the basic character set:
%
% [a-zA-Z0-9] -> Letters and decimal digits
% \s -> Any white-space character; equivalent to [ \f\n\r\t\v]
%       \t -> horizontal tab
%       \v -> vertical tab
%       \f -> form feed 
%       \n -> new line
%       \r -> carriage return
% [!"#%&''()*+,-./:;<=>?[\]^_{|}~] -> Graphic characters  
%
% ***********************************************************
% Copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:05:24CEST $
% Revision:     $Rev: 6115 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_ds_0082(system, cmd_s) %#ok<INUSD>
































































































