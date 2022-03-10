# Using Nuget CLI
---
This is a .NET Framework project. It's a non-SDK-style project, and the reference to the package is in a `packages.config` file.

Restore is done as such:
```
# in the directory of the solution
> nuget.exe restore.
```

In order for the project to actually use the package, the `.csproj` must include a reference to the package in the `.csproj` file:
```
 <ItemGroup>
    <Reference Include="Newtonsoft.Json">
      <HintPath>..\packages\Newtonsoft.Json.13.0.1\lib\net45\Newtonsoft.Json.dll</HintPath>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Core" />
    <Reference Include="System.Xml.Linq" />
    <Reference Include="System.Data.DataSetExtensions" />
    <Reference Include="Microsoft.CSharp" />
    <Reference Include="System.Data" />
    <Reference Include="System.Net.Http" />
    <Reference Include="System.Xml" />
```