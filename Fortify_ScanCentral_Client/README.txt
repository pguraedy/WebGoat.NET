1. Installation and Configuration Instructions

Unzip Fortify_ScanCentral_Client_<version>_x64.zip and add Fortify_ScanCentral_Client_<version>_x64/bin directory to your PATH environment variable

2. Instructions for Fortify on Demand packaging

These commands can be used to package your project for upload to Fortify on Demand.

MAVEN:

scancentral package -bt mvn -bf pom.xml -o mypayload.zip

GRADLE:

scancentral package –bt gradle –bf build.gradle –o mypayload.zip

MSBUILD:

scancentral package –bt msbuild –bf my.sln –o mypayload.zip

PYTHON:

scancentral package –bt none –o mypayload.zip

with additional parameters
--python-requirements <file> : To specify the Python project requirements file to install and collect dependencies.
--python-virtual-env <directory> : the Python virtual environment location.

(for more Python and other options run scancentral -h package)

For more example packaging commands, please see the documentation at
https://www.microfocus.com/documentation/fortify-software-security-center/2120/SC_SAST_Help_21.2.0/index.htm#Gen_SC_Package.htm?TocPath=Submitting%2520Scan%2520Requests%257C_____1

For more details about the ScanCentral Client options, please see the documentation at
https://www.microfocus.com/documentation/fortify-software-security-center/2120/SC_SAST_Help_21.2.0/index.htm#CLI.htm?TocPath=_____12