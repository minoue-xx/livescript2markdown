function str = processincludegraphics(str,format,filename)
% Copyright 2020 The MathWorks, Inc.

% markdown (GitHub): ![string]('path to a image')
% latex では \includegraphics[width=\maxwidth{56.196688409433015em}]{filename}
imageIdx = contains(str,"\includegraphics");
imageParts = str(imageIdx);

% When exported latex from live script, figures and inserted images
% are saved in 'imagedir' as image files.
% latex を生成した時点で Figure 等は画像としてimagedir に保存されている
imagedir = filename + "_images/";
imagedir = strrep(imagedir, '\', '/');

% for each images
for ii=1:length(imageParts)
    imagefilename = regexp(imageParts(ii),"\\includegraphics\[[^\]]+\]{([^{}]+)}", "tokens");
%     imagefilename = ls(imagedir + fileid + "*");
    
    switch format
        case 'qiita'
            % Qiita に移行する際は、画像ファイルを該当箇所に drag & drop する必要
            % TODO コメント追記：幅指定する場合には
            % <img src="" alt="attach:cat" title="attach:cat" width=500px>
            imageParts(ii) = regexprep(imageParts(ii),"\\includegraphics\[[^\]]+\]{"+imagefilename+"}",...
                "<--" + newline ...
                + "**Please drag & drop an image file here**" + newline ...
                + "Filename: **"+imagedir+imagefilename + "**" + newline ...
                + "If you want to set the image size use the following command" + newline ...
                + "<img src="" alt=""attach:cat"" title=""attach:cat"" width=500px>" + newline ...
                + "-->");
            
        case 'github'
            %  ![string]('path to a image')
            imageParts(ii) = regexprep(imageParts(ii),"\\includegraphics\[[^\]]+\]{"+imagefilename+"}",...
                "!["+imagefilename+"]("+imagedir+imagefilename+")");
    end
end

str(imageIdx) = imageParts;