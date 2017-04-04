Set-StrictMode -Version Latest
Set-PSDebug -Trace 1

$installDir="${env:PROFILE}-${env:PLATFORM}-${env:CONFIGURATION}"

7z a "${installDir}.zip" "${installDir}"
$? -or $(exit 1)

$msg=$(git log --graph -n 3 --abbrev-commit --pretty='format:%h - %s <%an>')
$msg=@("Automated build.")+$msg
$msg=$msg | Out-String

github-release `
  paulthomson/thrift `
  "v-${env:APPVEYOR_REPO_COMMIT}" `
  "${env:APPVEYOR_REPO_COMMIT}" `
  "${msg}" `
  "${installDir}.zip"

$? -or $(exit 1)

