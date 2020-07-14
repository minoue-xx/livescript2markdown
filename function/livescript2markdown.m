function mdfile = livescript2markdown(filename, options)
%% Automatically convert Live Script mlx file to markdown file
arguments
    filename (1,1) string
    options.outputfilename char = filename
    options.format char {mustBeMember(options.format,{'qiita','github'})} = 'github'
    options.png2jpeg logical = false
    options.tableMaxWidth (1,1) double = 20
end

% Remove extension from file name
[~, options.outputfilename, ~] = fileparts(options.outputfilename);

% Directory where conversion will be done
workdir = pwd;

% Add .mlx extension to source file
if ~endsWith(filename, '.mlx')
    filename = filename + ".mlx";
end

% Get mlx file info
mlxinfo = dir(filename);

% Check that mlx file exists
if length(mlxinfo) == 0 %#ok<ISMT>
    error(filename + " does not exist");
end

% Get full mlx file path
mlxfile = fullfile(mlxinfo.folder, mlxinfo.name);

% Get latex file path
latexfile = fullfile(workdir, options.outputfilename + ".tex");

% Create list of temporary files that will be deleted after conversion
tempfiles = [latexfile; "matlab.sty"];
% Delete files only if they don't exist before conversion
todelete = ~isfile(tempfiles);
filestodelete = tempfiles(todelete);

% Get path of images directory
imgdir = fullfile(workdir, options.outputfilename + "_images");
% Check that images directory doesn't exist before conversion
noimgdir = ~isfolder(imgdir);

% Convert mlx to latex (WARNING: undocumented function)
matlab.internal.liveeditor.openAndConvert(char(mlxfile), char(latexfile));

% Convert latex t markdown
args = namedargs2cell(options);
mdfile = latex2markdown(latexfile, args{:});
mdfile = fullfile(workdir, mdfile);

% Delete temporary files
for i = 1 : length(filestodelete)
    if isfile(filestodelete(i))
        delete(filestodelete(i));
    end
end

% Delete empty images folder
if noimgdir && isfolder(imgdir) && length(dir(imgdir)) == 2
    rmdir(imgdir);
end