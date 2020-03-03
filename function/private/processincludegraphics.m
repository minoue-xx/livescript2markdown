function str = processincludegraphics(str,format,filename,filepath)
% Copyright 2020 The MathWorks, Inc.

% Note: There are two cases in the tex
% 1: inserted image: \includegraphics[width=\maxwidth{64.52584044154541em}]{image_0}
% 2: generated figure: \includegraphics[width=\maxwidth{52.78474661314601em}]{figure_0.png}
%
% Inserted images needs to 

% markdown (GitHub): ![string]('path to a image')
% latex �ł� \includegraphics[width=\maxwidth{56.196688409433015em}]{filename}
imageIdx = contains(str,"\includegraphics");
imageParts = str(imageIdx);

% When exported latex from live script, figures and inserted images
% are saved in 'imagedir' as image files.
% latex �𐶐��������_�� Figure ���͉摜�Ƃ���imagedir �ɕۑ�����Ă���
imagedir = filename + "_images/";
imagedir = strrep(imagedir, '\', '/');

% for each images
for ii=1:length(imageParts)
    fileid = regexp(imageParts(ii),"\\includegraphics\[[^\]]+\]{([^{}]+)}", "tokens");
    imagefilename = ls(fullfile(filepath,imagedir,fileid + "*")); % get the actual filename with extention
    
    switch format
        case 'qiita'
            % Qiita �Ɉڍs����ۂ́A�摜�t�@�C�����Y���ӏ��� drag & drop ����K�v
            % TODO �R�����g�ǋL�F���w�肷��ꍇ�ɂ�
            % <img src="" alt="attach:cat" title="attach:cat" width=500px>
            imageParts(ii) = regexprep(imageParts(ii),"\\includegraphics\[[^\]]+\]{"+fileid+"}",...
                "<--" + newline ...
                + "**Please drag & drop an image file here**" + newline ...
                + "Filename: **"+imagedir+imagefilename + "**" + newline ...
                + "If you want to set the image size use the following command" + newline ...
                + "<img src="" alt=""attach:cat"" title=""attach:cat"" width=500px>" + newline ...
                + "-->");
            
        case 'github'
            %  ![string]('path to a image')
            imageParts(ii) = regexprep(imageParts(ii),"\\includegraphics\[[^\]]+\]{"+fileid+"}",...
                "!["+imagefilename+"]("+imagedir+imagefilename+")");
    end
end

str(imageIdx) = imageParts;