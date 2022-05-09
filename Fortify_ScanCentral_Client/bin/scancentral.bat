@echo off

rem /***************************************************************************
rem * (C) Copyright 2008-2021 Micro Focus or one of its affiliates. All Rights Reserved.
rem * The only warranties for products and services of Micro Focus and its affiliates and licensors 
rem * (“Micro Focus”) are set forth in the express warranty statements accompanying such products 
rem * and services. Nothing herein should be construed as constituting an additional warranty. 
rem * Micro Focus shall not be liable for technical or editorial errors or omissions contained herein. 
rem * The information contained herein is subject to change without notice. 
rem * Confidential computer software. Except as specifically indicated otherwise, a valid license 
rem * from Micro Focus is required for possession, use or copying. Consistent with FAR 12.211 and 12.212, 
rem * Commercial Computer Software, Computer Software Documentation, and Technical Data for Commercial 
rem * Items are licensed to the U.S. Government under vendor's standard commercial license.
rem ****************************************************************************/

set FORTIFY_HOME=%~dp0..

set JAVA_CMD=%FORTIFY_HOME%\jre\bin\java.exe

if not exist "%JAVA_CMD%" (
	if ""=="%JAVA_HOME%" (
		set JAVA_CMD=java.exe
		goto Run
	) else (
		set JAVA_CMD=%JAVA_HOME%\bin\java.exe
		goto CheckJavaHome
	)
)

:CheckJavaHome
if not exist "%JAVA_CMD%" (
	echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
	echo Please set the JAVA_HOME variable in your environment to match the
	echo location of your Java installation.
	exit /b 1
) else (
	goto Run
)

:Run
set WORKER_PROPS=%FORTIFY_HOME%\Core\config\worker.properties

set ARGS=
:CollectArgsLoop
set ARGS=%ARGS% %1
shift
if not "%~1"=="" goto CollectArgsLoop

if not "%CLOUDSCAN_LOG%"=="" (
    echo CLOUDSCAN_LOG variable is not supported any longer. Use SCANCENTRAL_LOG variable instead
)

:RunClient
"%JAVA_CMD%" -Dfortify.scancentral.dir="%FORTIFY_HOME%" -Dworker.props="%WORKER_PROPS%" -Dlog4j.dir="%SCANCENTRAL_LOG%" -jar "%FORTIFY_HOME%\Core\lib\scancentral-launcher-21.2.3.0002.jar" %ARGS%

:End