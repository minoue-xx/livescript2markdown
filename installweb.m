TEMP_INST.uuid = '';
TEMP_INST.url = matlab.addons.repositories.FileExchangeRepository().getAddonURL(TEMP_INST.uuid);
TEMP_INST.fname = websave(tempname + ".mltbx", TEMP_INST.url);
TEMP_INST.info = matlab.addons.toolbox.installToolbox(TEMP_INST.fname);
fprintf('<strong>%s v%s installed</strong>\n', TEMP_INST.info.Name, TEMP_INST.info.Version);
delete(TEMP_INST.fname);
clear TEMP_INST