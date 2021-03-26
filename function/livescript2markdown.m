function mdFileAbsPath = livescript2markdown(mlxFilePath, mdFilePath, opts)
%% Automatically convert Live Script mlx file to markdown file
arguments
    mlxFilePath (1,:) char {mustBeFile}
    mdFilePath (1,:) char = ''
    opts.Format char {mustBeMember(opts.Format,{'qiita','github'})} = 'github'
    opts.Png2jpeg logical = false
    opts.TableMaxWidth (1,1) double = 20
    opts.FixLinks logical = true % Fix MATLAB special links
    opts.NormalizeLines logical = true % Remove extra empty lines
    opts.AddCredentials logical = false % Add toolbox credentials
end

if isempty(mdFilePath)
    % If no result file specified
    % Generate file to current folder
    mdFileFolder = pwd;
    % Get file name from source file
    [~, mdFileName, ~] = fileparts(mlxFilePath);
else
    % If result file specified
    [mdFileFolder, mdFileName, mdFileExt] = fileparts(mdFilePath);
    % Check result file extension
    if mdFileExt ~= ".md"
        error('Markdown file should have .md extension');
    end
    % Select result file folder
    if isempty(mdFileFolder)
        mdFileFolder = pwd;
    end
end

% Get full mlx file path
mlxFileAbsPath = getAbsPath(mlxFilePath);

% Directory where conversion will be done
workFolder = getAbsPath(mdFileFolder);

% Get latex file path
latexFileAbsPath = fullfile(workFolder, mdFileName + ".tex");

% Create list of temporary files that will be deleted after conversion
tempFiles = [latexFileAbsPath; fullfile(workFolder, "matlab.sty")];
% Delete files only if they don't exist before conversion
filesToDelete = tempFiles(~isfile(tempFiles));

% Get path of images directory
imgFolder = fullfile(workFolder, mdFileName + "_images");
% Check that images directory doesn't exist before conversion
isNoImgFolder = ~isfolder(imgFolder);

% Convert mlx to latex (WARNING: undocumented function)
matlab.internal.liveeditor.openAndConvert(char(mlxFileAbsPath), char(latexFileAbsPath));

% Go to new work folder
prevWorkFolder = cd(workFolder);

% Prepare latex to markdown conversion parameters
argOpts = struct('outputfilename', mdFileName, 'format', opts.Format, ...
    'png2jpeg', opts.Png2jpeg, 'tableMaxWidth', opts.TableMaxWidth);
args = namedargs2cell(argOpts);
% Call latex2markdown function (convert latex to markdown)
mdFileNameExt = latex2markdown(latexFileAbsPath, args{:});
% Convert result to absolute path
mdFileAbsPath = getAbsPath(mdFileNameExt);

% Return to previous work folder
cd(prevWorkFolder);

% Delete temporary files
for i = 1 : length(filesToDelete)
    if isfile(filesToDelete(i))
        delete(filesToDelete(i));
    end
end

% Delete empty images folder
if isNoImgFolder && isfolder(imgFolder) && length(dir(imgFolder)) == 2
    rmdir(imgFolder);
end

%% Markdown file postprocessing
% Read text from markdown file
txt = fileread(mdFileAbsPath);
txt = strtrim(txt);
% Process text
if opts.FixLinks
    txt = replace(txt, "[matlab:" + ["open" "winopen" "cd"] + " ", '[');
end
if opts.NormalizeLines
    ls = split(string(txt), newline);
    ni = find(ls == "");
    nid = [0; diff(ni)];
    ls(ni(nid == 1)) = [];
    txt = join(ls, newline);
    txt = strtrim(txt);
end
if opts.AddCredentials
    [~, mlxFileName, mlxFileExt] = fileparts(mlxFilePath);
    txt = string(txt) + newline + newline +...
        sprintf("***\n*Generated from %s with [Live Script to Markdown Converter](%s)*",...
        string(mlxFileName) + mlxFileExt, 'https://github.com/roslovets/livescript2markdown');
end
% Write processed text back to file
writematrix(char(txt), mdFileAbsPath, 'FileType', 'text', 'QuoteStrings', false);
end


function absPath = getAbsPath(relPath)
%% Convert relative path to absolute
arguments
    relPath (1,:) char
end
if ~isfile(relPath) && ~isfolder(relPath)
    error('No such file or folder: %s', relPath);
end
% Get file/folder info
info = dir(relPath);
% Get absolute path
absPath = fullfile(info(1).folder, info(1).name);
end
