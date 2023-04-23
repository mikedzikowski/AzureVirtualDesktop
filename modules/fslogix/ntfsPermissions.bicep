param _artifactsLocation string
@secure()
param _artifactsLocationSasToken string
@secure()
param CommandToExecute string
param Location string
param ManagementVmName string
param NamingStandard string
param Tags object
param Timestamp string
param UserAssignedIdentityResourceId string


resource customScriptExtension 'Microsoft.Compute/virtualMachines/extensions@2020-12-01' = {
  name: '${ManagementVmName}/CustomScriptExtension'
  location: Location
  tags: Tags
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.10'
    autoUpgradeMinorVersion: true
    settings: {
      fileUris: [
        '${_artifactsLocation}Set-NtfsPermissions.ps1${_artifactsLocationSasToken}'
      ]
      timestamp: Timestamp
    }
    protectedSettings: {
      commandToExecute: CommandToExecute
    }
  }
}

module deploymentScript '../deploymentScript.bicep' = {
  name: 'DeploymentScript_FSLogixCleanUp_${Timestamp}'
  params : {
    Arguments: '-VirtualMachineName ${ManagementVmName} -ResourceGroupName ${resourceGroup().name}'
    Location: Location
    Name: 'ds-${NamingStandard}-fslogixCleanUp'
    ScriptContainerSasToken: _artifactsLocationSasToken
    ScriptContainerUri: _artifactsLocation
    ScriptName: 'Remove-AzureVirtualMachine.ps1'
    Timestamp: Timestamp
    UserAssignedIdentityResourceId: UserAssignedIdentityResourceId
  }
  dependsOn: [
    customScriptExtension
  ]
}
