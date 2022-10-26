# create the /azure folder to hold the azuredeploy files
new-item -Name azure -ItemType directory -ErrorAction SilentlyContinue

# generate the azuredeploy.json
bicep build .\infra\main.bicep --outfile azure\azuredeploy.json

# generate the azuredeploy.parameters.json (if needed)

# generate the azuredeploy.md

function get-repopath {
    return "charris-msft%2Ftodo-csharp-cosmos-sql"
}

function get-branch {
    return "main"
}

$repoPath = get-repopath

$branchName = get-branch

$readme = @"
# Use the Deploy to Azure button to deploy your project to Azure via the Azure Portal

[![Deploy to Azure][azure-img]][azure-url]

[azure-img]: https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true
[azure-url]: https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2F$repoPath%2F$branchName%2Fazure%2fazuredeploy.json
"@

$readme | out-file "azure/readme.md"

Write-Output "Your new files under /azure are ready to commit and push to GitHub."

