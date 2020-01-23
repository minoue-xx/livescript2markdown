function str2md = processDocumentOutput(str2md)

%% 2-1: Fix latex conventions for non-literal parts
% ^ (live script) -> \textasciicircum{} (latex)
str2md = replace(str2md,"\textasciicircum{}","^");
% _ (live script) -> \_ (latex) example: test_case -> test\_ case
str2md = replace(str2md,"\_","_");
% / backslash (live script) -> \textbackslash{} (latex)
str2md = replace(str2md,"\textbackslash{}","\");
% > (live script) -> \textgreater{} (latex)
str2md = replace(str2md,"\textgreater{}",">");
% < (live script) -> \textless{} (latex)
str2md = replace(str2md,"\textless{}","<");
% $ (live script) -> \$ (latex)
str2md = replace(str2md,"\$","$");

% f: { (live script) -> \} (latex) (leave it till end)
% g: } (live script) -> \{ (latex) (leave it till end)
% str2md = replace(str2md,"\{","{");
% str2md = replace(str2md,"\}","}");

%% 2-3: Text decoration (������������)
% \textbf{����}
% \textit{�C�^���b�N}
% \underline{�����t������}
% \texttt{��������}
% and conbinations
% \textit{\textbf{�C�^���b�N����}}
% \texttt{\textbf{��������}}
% \underline{\textbf{�����t������}}�A
% \underline{\textit{\textbf{�����t���C�^���b�N����}}}�A
% \texttt{\underline{\textit{\textbf{�����t���C�^���b�N��������}}}}

% To deal with \{ and \} inside the command which should be left as they
% are
str2md = replace(str2md,"\{", "BackslashCurlyBlacketOpen");
str2md = replace(str2md,"\}", "BackslashCurlyBlacketClose");

% Need to keep this execution sequence
str2md = regexprep(str2md,"\\textbf{([^{}]+)}","**$1**");
str2md = regexprep(str2md,"\\textit{([^{}]+)}","*$1*");
str2md = regexprep(str2md,"\\underline{([^{}]+)}","$1"); % Ignore underline (�����͖����j
str2md = regexprep(str2md,"\\texttt{(\*{0,3})([^*{}]+)(\*{0,3})}","$1`$2`$3");

% Note on the processing \testt
% str2md = regexprep(str2md,"\\texttt{([^{}]+)}","`$1`");
% gives
% `**��������**`
% which does not work. ` ` needs to be most inside.
% `` ���ł��O���ɂ��邪��ԓ����ɂ���K�v������B

%% 2-2: Titile and headings (���o������)
str2md = regexprep(str2md,"\\matlabtitle{([^{}]+)}","# $1");
str2md = regexprep(str2md,"\\matlabheading{([^{}]+)}","# $1");
str2md = regexprep(str2md,"\\matlabheadingtwo{([^{}]+)}","## $1");
str2md = regexprep(str2md,"\\matlabheadingthree{([^{}]+)}","### $1");

%% 2-6: Hyperlinks (�n�C�p�[�����N)
% Markdown: [string](http://xxx.com)
% latex: \href{http://xxx.com}{string}
str2md = regexprep(str2md,"\\href{([^{}]+)}{([^{}]+)}","[$2]($1)");

str2md = replace(str2md,"BackslashCurlyBlacketOpen","\{");
str2md = replace(str2md, "BackslashCurlyBlacketClose","\}");

%% 2-4: Quotation (���p�p���O���t)
% Markdown: >
% Latex:
% \begin{par}
% \begin{center}
% xxxx
% \end{center}
% \end{par}
% Note: \includegraphics is an exception
idxNonGraphics = ~contains(str2md,"\includegraphics");
str2md(idxNonGraphics) = replace(str2md(idxNonGraphics),...
    "\begin{par}"+newline+"\begin{center}"+newline,"> ");

%% 2-5: Delete unnecessary commands (�s�v�R�}���h���폜)
% Delete table of contents: �ڎ��͌����_�ō폜�iTODO�j
% ex: \label{H_D152BAC0}
str2md = regexprep(str2md,"\\matlabtableofcontents{([^{}]+)}"+newline, "");
str2md = regexprep(str2md,"\\label{[a-zA-Z_0-9]+}","");

% Commands to specify the text position
str2md = erase(str2md,"\begin{par}");
str2md = erase(str2md,"\end{par}");
str2md = erase(str2md,"\begin{flushleft}");
str2md = erase(str2md,"\end{flushleft}");
str2md = erase(str2md,"\begin{center}");
str2md = erase(str2md,"\end{center}");

%% 2-7: Unordered list (���X�g)
% markdown: add - to each item
% latex:
%      \begin{itemize}
%      \setlength{\itemsep}{-1ex}
%         \item{\begin{flushleft} ���X�g�P \end{flushleft}}
%         \item{\begin{flushleft} ���X�g�Q \end{flushleft}}
%         \item{\begin{flushleft} ���X�g�R \end{flushleft}}
%      \end{itemize}
str2md = erase(str2md,"\setlength{\itemsep}{-1ex}"+newline);
itemizeIdx = contains(str2md,["\begin{itemize}","\end{itemize}"]);
itemsParts = str2md(itemizeIdx);
partsMarkdown = regexprep(itemsParts,"\\item{([^{}]+)}","- $1");
partsMarkdown = erase(partsMarkdown,["\begin{itemize}","\end{itemize}"]);
str2md(itemizeIdx) = partsMarkdown;

%% 2-8: Ordered list (���t�����X�g)
% markdown: 1. itemname
% latex:
%      \begin{enumerate}
%      \setlength{\itemsep}{-1ex}
%         \item{\begin{flushleft} ���X�g�P \end{flushleft}}
%         \item{\begin{flushleft} ���X�g�Q \end{flushleft}}
%         \item{\begin{flushleft} ���X�g�R \end{flushleft}}
%      \end{enumerate}
str2md = erase(str2md,"\setlength{\itemsep}{-1ex}"+newline);
itemizeIdx = contains(str2md,["\begin{enumerate}","\end{enumerate}"]);
itemsParts = str2md(itemizeIdx);
partsMarkdown = regexprep(itemsParts,"\\item{([^{}]+)}","1. $1");% Any numder works
partsMarkdown = erase(partsMarkdown,["\begin{enumerate}","\end{enumerate}"]);
str2md(itemizeIdx) = partsMarkdown;

%% 2-9: Symbolic output (�V���{���b�N�o��)
% markdown: inline equation
% latex:
% \begin{matlabsymbolicoutput}
% ans =
%     $\displaystyle -\cos \left(x\right)$
% \end{matlabsymbolicoutput}
% str2md = erase(str2md,"\begin{matlabsymbolicoutput}"+newline);
% str2md = erase(str2md,"\end{matlabsymbolicoutput}");
% str2md = erase(str2md,"\hskip1em");

symoutIdx = contains(str2md,["\begin{matlabsymbolicoutput}","\end{matlabsymbolicoutput}"]);
symoutParts = str2md(symoutIdx);
tmp = erase(symoutParts,"\begin{matlabsymbolicoutput}"+newline);
tmp = replace(tmp,"$\displaystyle","$$");
partsMarkdown = replace(tmp,"$"+newline+"\end{matlabsymbolicoutput}","$$");
str2md(symoutIdx) = partsMarkdown;
% This part will be processed by processEquations.m

%%
% latex:
% \begin{matlabsymbolicoutput}
% a = 
%     $\displaystyle \left(\begin{array}{cccc}
% \cos \left(\theta \right) & -\sin \left(\theta \right) & 0 & 0\\
% \sin \left(\theta \right) & \cos \left(\theta \right) & 0 & 0\\
% 0 & 0 & 1 & 0\\
% 0 & 0 & 0 & 1
% \end{array}\right)$
% \end{matlabsymbolicoutput}



%% 2-10: table output (table �^�f�[�^�̏o��)
% markdown:
% | TH left | TH center | TH right |
% | :--- | :---: | ---: |
% | TD | TD | TD |
% | TD | TD | TD |
% latex:
% \begin{matlabtableoutput}
% {
% \begin{tabular} {|l|c|r|}\hline
% \mlcell{TD} & \mlcell{TD} & \mlcell{TD} \\ \hline
% \mlcell{TD} & \mlcell{TD} & \mlcell{TD} \\
% \hline
% \end{tabular}
% }
% \end{matlabtableoutput}
idxTblOutput = startsWith(str2md,"\begin{matlabtableoutput}"+newline);
tableLatex = extractBetween(str2md(idxTblOutput),...
    "\begin{tabular}","\end{tabular}");

tableMD = strings(sum(idxTblOutput),1);
for ii=1:sum(idxTblOutput)
    tablecontents = split(tableLatex(ii),newline);
    formatLatex = tablecontents(1);
    headerLatex = tablecontents(2);
    bodyLatex = tablecontents(3:end);
    
    format = regexp(formatLatex,"\{([^{}]+)}\\hline",'tokens');
    format = format{:};
    format = replace(format, "c",":--:");
    format = replace(format, "l",":--");
    format = replace(format, "r","--:");
    
    % MultiColumn is not standard in markdown.
    % It only happens as a variable name in MATLAB
    % so adding special case for processing headerLatex
    multicol = regexp(headerLatex,"\\multicolumn{(\d)+}",'tokens');
    tmp = regexp(headerLatex,"\\mlcell{(.*?)}",'tokens');
    if isempty(multicol)
        header = "|" + join([tmp{:}],"|") + "|";
    else
        nRepeat = double(multicol{:});
        header = "|" + join([tmp{:}],"|") + join(repmat("|",1,nRepeat));
    end
    
    body = string;
    for jj=1:length(bodyLatex)
        tmp = regexp(bodyLatex(jj),"\\mlcell{(.*?)}",'tokens');
        
        if isempty(tmp)
            break;
        end
        body = body + "|" + join([tmp{:}],"|") + "|" + newline;
    end
    
    tableMD(ii) = strjoin([header,format,body],newline);
end
str2md(idxTblOutput) = tableMD;

%% finish up
str2md = replace(str2md,"\{","{");
str2md = replace(str2md,"\}","}");