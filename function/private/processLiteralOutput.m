function [str, idxLiteral] = processLiteralOutput(str)
%% MATLAB コード部分
% Qiita では以下の構文
% ```matlab
% （コード）
%```
% tmp = replace(tmp,"\begin{matlabcode}","```matlab");
% tmp = replace(tmp,"\end{matlabcode}","```");


%% 出力表示について
% latex では \begin{matlabtoutput}
% 現時点では最もシンプルな形のみ
% TODO：その他の出力形式確認
% tmp = replace(tmp,"\begin{matlaboutput}","```");
% tmp = replace(tmp,"\end{matlaboutput}","```");

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

