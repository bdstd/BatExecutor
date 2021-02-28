program launcher;

uses
  Windows, ShellApi, SysUtils;

var
  path, exe_name, exe_param, all_exe_param, bat_name, bat_title, cmd_sysnative, cmd: string;
  i: Integer;

begin
  path:= ExtractFilePath(ParamStr(0));
  exe_name:= ExtractFileName(Paramstr(0));
  bat_name:= StringReplace(exe_name, '.exe', '.bat', [rfIgnoreCase]);
  bat_title:= 'BatExecutor 1.5 By bdstd@2021 - http://tools-warnet.blogspot.com/';
  cmd:= GetEnvironmentVariable('windir')+'\system32\cmd.exe';
  cmd_sysnative:= GetEnvironmentVariable('windir')+'\sysnative\cmd.exe';
  if fileexists(cmd_sysnative) then
    cmd:= cmd_sysnative
  ;
  exe_param:='';
  all_exe_param:='';
  for i:=0 to ParamCount do
    if exe_param='' then
      begin
        exe_param:= 'set "exe_param'+IntToStr(i)+'='+ParamStr(i)+'"'
      end
    else
      begin
        exe_param:= exe_param+' && set "exe_param'+IntToStr(i)+'='+ParamStr(i)+'"';
        if all_exe_param='' then
          all_exe_param:= ParamStr(i)
        else
          all_exe_param:= all_exe_param+' '+ParamStr(i)
        ;
      end
    ;
  ;
  if fileexists(path+bat_name) then
      if fileexists(path+'.debug') then
        ShellExecute(0, 'open', PChar(cmd), PChar('/k title '+bat_title+' && set "all_exe_param='+all_exe_param+'" && '+exe_param+' && cd /d '+path+' && call '+bat_name), PChar(path), SW_SHOW)
      else
        ShellExecute(0, 'open', PChar(cmd), PChar('/c title '+bat_title+' && set "all_exe_param='+all_exe_param+'" && '+exe_param+' && cd /d '+path+' && call '+bat_name), PChar(path), SW_HIDE)
  else
    ShellExecute(0, 'open', PChar(cmd), PChar('/k title '+bat_title+' && echo [!] File '+path+bat_name+' Tidak Ditemukan'), PChar(path), SW_SHOW)
  ;
end.