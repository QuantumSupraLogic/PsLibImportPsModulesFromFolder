function Import-PsModulesFromFolder {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $SourceDir
    )
    
    begin {
        
    }
    
    process {
        $User = $true
        if ($User) {
            $env:PSModulePath = $env:PSModulePath.Replace(";$HOME\Documents\PowerShell\Modules", '')
            $env:PSModulePath += ";$HOME\Documents\PowerShell\Modules"
            $destination = "$HOME\Documents\PowerShell\Modules" 
        }
        else {
            $destination = "$Env:ProgramFiles\WindowsPowerShell\Modules" 
        }
        if (Get-Module $module) {
            Remove-Module $module
        }
        Join-Path $sourceDir "$module\$module" | Copy-Item -Destination $destination -Recurse -Force
        
        Import-Module -Name $module 
        
        Get-Command -Module $module
    }
    
    end {
        
    }
}
