function genDoc()
% Generate docs from mlx source
proj = currentProject();
srcdoc = fullfile(proj.RootFolder, 'doc/GettingStarted.mlx');
resdoc = fullfile(proj.RootFolder, 'README.md');
livescript2markdown(srcdoc, resdoc, 'AddCredentials', true);
