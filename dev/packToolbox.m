function tbxFilePath = packToolbox(v)
% Pack toolbox installer
arguments
    v (1, :) char = ''
end
proj = currentProject();
tbxProj = fullfile(proj.RootFolder, 'livescript2markdown_toolbox.prj');
if ~isempty(v)
    matlab.addons.toolbox.toolboxVersion(tbxProj, v);
end
tbxFileName = sprintf('%s.mltbx', proj.Name);
tbxFilePath = fullfile(proj.RootFolder, tbxFileName);
matlab.addons.toolbox.packageToolbox(tbxProj, tbxFilePath);
