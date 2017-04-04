Set-StrictMode -Version Latest
Set-PSDebug -Trace 1

mkdir temp
cd temp
Invoke-WebRequest https://github.com/paulthomson/github-release/releases/download/v1.0.9.1/github-release_v1.0.9.1_windows_amd64.tar.gz -OutFile github-release.tar.gz

7z x github-release.tar.gz
$? -or $(exit 1)

7z x github-release.tar
$? -or $(exit 1)

cd ..

cinst -y winflexbison3
$? -or $(exit 1)

