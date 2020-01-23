function [str, idxLiteral] = processLiteralOutput(str)
% Copyright 2020 The MathWorks, Inc.

%% MATLAB Code
% Latex: 
% \begin{matlabcode}(code)\end{matlabcode}
% \begin{verbatim}(code)\end{verbatim}
% \begin{lstlisting}(code)\end{lstlisting}
%
% Markdown
% ```matlab
% ÅicodeÅj
%```
%% Literal Outputs
% Latex: 
% \begin{matlaboutput}(output)\end{matlaboutput}
%
% Markdown
% ```
%  (output)
% ```
% Note: Other outputs (matlabsymbolicoutout, matlabtableoutput)
% will be processed in processDocumentOutput.m

idx_lstlisting = startsWith(str,"\begin{lstlisting}");
idx_verbatim = startsWith(str,"\begin{verbatim}");
idx_matlabcode = startsWith(str,"\begin{matlabcode}");
idx_matlaboutput = startsWith(str,"\begin{matlaboutput}");

idxLiteral = idx_lstlisting | idx_verbatim | idx_matlabcode | idx_matlaboutput;

str(idx_lstlisting) = "```matlab" + extractBetween(str(idx_lstlisting),...
    "\begin{lstlisting}","\end{lstlisting}") + "```";
str(idx_verbatim) = "```matlab" + extractBetween(str(idx_verbatim),...
    "\begin{verbatim}","\end{vervatim}") + "```";
str(idx_matlabcode) = "```matlab" + extractBetween(str(idx_matlabcode),...
    "\begin{matlabcode}","\end{matlabcode}") + "```";
str(idx_matlaboutput) = "```" + extractBetween(str(idx_matlaboutput),...
    "\begin{matlaboutput}","\end{matlaboutput}") + "```";

