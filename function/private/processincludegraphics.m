function str = processincludegraphics(str,format,filename)
% Copyright 2020 The MathWorks, Inc.

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
    imagefilename = regexp(imageParts(ii),"\\includegraphics\[[^\]]+\]{([^{}]+)}", "tokens");
%     imagefilename = ls(imagedir + fileid + "*");
    
    switch format
        case 'qiita'
            % Qiita �Ɉڍs����ۂ́A�摜�t�@�C�����Y���ӏ��� drag & drop ����K�v
            % TODO �R�����g�ǋL�F���w�肷��ꍇ�ɂ�
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