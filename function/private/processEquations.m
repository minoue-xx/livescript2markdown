function str2md = processEquations(str2md, format)
% Copyright 2020 The MathWorks, Inc.
% 
% For Github users: Use https://latex.codecogs.com
% see. http://idken.net/posts/2017-02-28-math_github/ (Japanese)
%
% For Qiita users: (Qiita platform renders equations via mathML)
% Leave inline equation as it is (文中の数式は latex で $equation$ なのでそのまま)
% and $$equation$$ will be changed to
% ```math
% equation
% ```
%
% For Wordpress users: (Assume Wordpress platform renders equations via WP QuickLaTeX)
% Add [latex] short code to the first line. 
% Leave inline equation as it is (文中の数式は latex で $equation$ なのでそのまま)
% and $$equation$$ will be changed to
% [latex]
% equation
% [/latex]
% See https://ja.wordpress.org/plugins/wp-quicklatex/

switch format
    case 'qiita'
        str2md = regexprep(str2md,"[^`]?\$\$([^$]+)\$\$[^`]?",newline+"```math" + newline + "$1" + newline + "```");
    case 'github'
        tt = regexp(str2md,"[^`]?\$\$([^$]+)\$\$[^`]?", 'tokens');
        idx = cellfun(@iscell,tt); 
        % if tt contains 0x0 string, horzcat(tt{:}) generates string vector
        % whereas if tt with cell only, horzcat(tt{:}) generates cell
        % vector... so.
        parts = horzcat(tt{idx});
        for ii=1:length(parts)
            eqncode = replace(parts{ii},string(newline)," ");
            eqncode = replace(eqncode," ", "&space;");
            partsMD = "<img src=""https://latex.codecogs.com/gif.latex?" ...
                + eqncode + """/>";
            str2md = replace(str2md, "$$"+parts(ii)+"$$", partsMD);
        end
        
        % Inline
        tt = regexp(str2md,"[^`$]\$([^$]+)\$[^`$]", 'tokens');
        parts = horzcat(tt{:});
        for ii=1:length(parts)
            eqncode = replace(parts(ii)," ", "&space;");
            partsMD = "<img src=""https://latex.codecogs.com/gif.latex?\inline&space;" ...
                + eqncode + """/>";
            str2md = replace(str2md, "$"+parts(ii)+"$", partsMD);
        end
case 'wpquicklatex'
        % Add [latexpage] short code into the firstline to enable Quick LaTeX processing. 
        str2md(1,1) = "[latexpage]" + newline + str2md(1,1);
        % Convert the line break character from  \\ to \\\\ to take into account the de-escaping by Gutenberg editor.
        str2md = regexprep(str2md,"\\\\", "\\\\\\\\");
        % convert display block from  $$ ... $$ to \[ ... \]. 
        str2md = regexprep(str2md,"[^`]?\$\$([^$]+)\$\$[^`]?",newline+"\\\\[" + newline + "$1" + newline + "\\\\]");
end
