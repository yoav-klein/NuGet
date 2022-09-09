

function Build-Project() {
	# first, build the package
	& "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
}

function Gen-Nuspec() {
	../../nuget.exe spec
}

function Pack() {
	../../nuget.exe pack .
}

function Push-Package() {
       $APIKEY=$(cat apikey)
	../../nuget.exe push -Source "py" -Apikey $APIKEY using-nuget-cli.2.4.2.nupkg
}