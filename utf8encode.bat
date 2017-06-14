For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%a%%b%%c)
cd U:/Temp/CAROL_interface_2012_output
mkdir new_test_dir
REM powershell does not support variable names with percentage signs, which is why I have to rename it
powershell foreach($i in ls -name P91HLRL_CAROL_US*) { get-content $i ^| out-file -encoding utf8 -filepath "new_test_dir"/$i }
ren "new_test_dir" "%mydate% weekly run"
xcopy "%mydate% weekly run" \\Client\C$\temp\"CAROL Files"\"%mydate% weekly run" /E /S /I
xcopy "%mydate% weekly run" \\fsusnas05\G$\HRIS\INTERFACES\"L'Oreal France"\"CAROL Files"\"2017 Interface" /E /S /I
PAUSE
