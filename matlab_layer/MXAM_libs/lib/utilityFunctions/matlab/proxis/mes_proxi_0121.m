% MES check: proxi_0121 - Verwendung von Vektoren und Matrizen
% function [result,cr_items,r_stats] = mes_proxi_0121(system, cmd_s)
%
% RETURN VARIABLES:
% ==================
% result    - check summary(passed/failed/error messages)
% cr_items  - list of individual results of checked items
%
% INPUT ARGUMENTS:
% =================
% system    - model/subsystem to be checked
% cmd_s     - check options, syntax /<key>:<val>, for details See also mes_jc_0061
%
% MES CHECK:
% ==========
% proxi_0121 - Vektoren und Matrizen duerfen mittels Mux-Bloecken erzeugt und
% muessen mittels Demux-Bloecken aufgeloest werden(die Verwendung von
% Bus-Selector Bloecken ist hierzu verboten. Siehe Simulink Hilfe zur
% Verwendung von Bussen und Vektoren). Um die Einhaltung dieser
% Richtlinie zu unterstützen, sind die Diagnose-Optionen "Mux blocks used
% to create bus signals" sowie "Bus signal treated as vector"
% einzuschalten.
%
% PASS/FAIL CRITERIA:
% ================
% Wenn alle Eingänge eines Mux denselben Datentyp besitzen und die Ausgabe
% durch einen Demux-Block zerlegt wird und alle Busse durch einen
% Busselektor zerlegt werden und die Diagnoseoptionen 'mux blocks used to
% create bus signals' und 'bus signal treated as vector' auf wahr gesetzt
% sind, so erhält das Modell ein Pass, andernfalls ein Fail.
% Anmerkung:
% 1. Wenn der Eingang eines Demux ein Bus mit demselben Datentyp (Vektor
%    oder Matrix) ist und die Quelle des Demux kein Buscreator ist
%    und der Bus vom System als Vektor behandelt wird, so wird kein Failure
%    gemeldet.
% Wenn sich in obigem Fall an Stelle des Demux ein Busselektor befindet,
%      weil die Eingabe vermutlich ein Vektor ist, so wird ein Error
%      gemeldet.
% Wenn im obigen Fall die Quelle ein Buscreator ist, so wird der Error für
% den Demux gemeldet, jedoch nicht für den Buscreator.
% 2. Das TargetLink-Modell kann nicht überprüft werden, da der Datentyp der
% Signale anders zu behandeln ist.
%
% Fix action:
% Set setting 'mux blocks used to
% create bus signals' und 'bus signal treated as vector' to 'error' if it
% is not set.
% ***********************************************************
% copyright:    Model Engineering Solutions
% Date:         $Date: 2020/07/31 16:10:44CEST $
% Version:      $Rev: 15479 $
% ***********************************************************

function [result,cr_items,r_stats] = mes_proxi_0121(system, cmd_s, reg, s_regerr)









































































































































































































































































































































