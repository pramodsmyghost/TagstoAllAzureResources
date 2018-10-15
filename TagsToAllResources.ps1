<#
    .SYNOPSIS
        This script will check and apply Tags to All resources in MI Subscription
    
    .DESCRIPTION
        This script will add Department and Environment Tags to all the Azure resources based on the resource group name in MI Subscription where they do not exist.
     
    .NOTES
        File          :    TagsToResources.ps1
        Author        :    P V Pramod Reddy
        Company       :    LTI
        Email         :    pramodreddy.p.v@lntinfotech.com
        Created       :    17-09-2018
        Last Updated  :    
        Version       :    1.0
    
    .INPUTS
        None
#>  

Param(

    [Parameter(Mandatory= $true)]  
    [PSCredential]$AzureOrgIdCredential,

    [Parameter(Mandatory= $true)]
    [string]$SubcriptionID = "bb3d0ed0-bf9b-442d-83d5-3b059843dd52"

)

# Login to the Subscription
$Null = Login-AzureRMAccount -Credential $AzureOrgIdCredential  
$Null = Get-AzureRmSubscription -SubscriptionID $SubcriptionID | Select-AzureRMSubscription

# Collect the Resource Groups
$ResourceGroups = Get-AzureRmResourceGroup
foreach ($RG in $ResourceGroups)
{
    if($RG.ResourceGroupName -like "*DEV*")
    {
        # Tag the Resource Group
        if($RG.tags -eq $NULL)
        {
            Set-AzureRmResource -Tag @{ Department="MI"; Environment="DEV" } -ResourceId $RG.ResourceId -Force
        }
        else
        {
            if($RG.tags.Department -eq $NULL)
            {
                $RG.Tags.Add("Department", "MI")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }
            if($RG.tags.Environment -eq $NULL)
            {
                $RG.Tags.Add("Environment", "DEV")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }            
        }
        
        # Collect the Resources
        $resources = Get-AzureRmResource -ResourceGroupName $RG.ResourceGroupName
        foreach ($resource in $resources)
        {
            # Tag the Resources in the Resource Group
            if($resource.tags -eq $NULL)
            {
                Set-AzureRmResource -Tag @{ Department="MI"; Environment="DEV" } -ResourceId $resource.ResourceId -Force
            }
            else
            {    
                if($resource.tags.Department -eq $NULL)
                {
                    $Resource.Tags.Add("Department", "MI")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
                if($resource.tags.Environment -eq $NULL)
                {
                    $Resource.Tags.Add("Environment", "DEV")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
            }
            
        }
    }
    if($RG.ResourceGroupName -like "*UAT*")
    {
        # Tag the Resource Group
        if($RG.tags -eq $NULL)
        {
            Set-AzureRmResource -Tag @{ Department="MI"; Environment="UAT" } -ResourceId $RG.ResourceId -Force
        }
        else
        {
            if($RG.tags.Department -eq $NULL)
            {
                $RG.Tags.Add("Department", "MI")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }
            if($RG.tags.Environment -eq $NULL)
            {
                $RG.Tags.Add("Environment", "UAT")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }            
        }
        
        # Collect the Resources
        $resources = Get-AzureRmResource -ResourceGroupName $RG.ResourceGroupName
        foreach ($resource in $resources)
        {
            # Tag the Resources in the Resource Group
            if($resource.tags -eq $NULL)
            {
                Set-AzureRmResource -Tag @{ Department="MI"; Environment="UAT" } -ResourceId $resource.ResourceId -Force
            }
            else
            {    
                if($resource.tags.Department -eq $NULL)
                {
                    $Resource.Tags.Add("Department", "MI")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
                if($resource.tags.Environment -eq $NULL)
                {
                    $Resource.Tags.Add("Environment", "UAT")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
            }
            
        }
    }
    if($RG.ResourceGroupName -like "*PRD*")
    {
        # Tag the Resource Group
        if($RG.tags -eq $NULL)
        {
            Set-AzureRmResource -Tag @{ Department="MI"; Environment="PROD" } -ResourceId $RG.ResourceId -Force
        }
        else
        {
            if($RG.tags.Department -eq $NULL)
            {
                $RG.Tags.Add("Department", "MI")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }
            if($RG.tags.Environment -eq $NULL)
            {
                $RG.Tags.Add("Environment", "PROD")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }            
        }
        
        # Collect the Resources
        $resources = Get-AzureRmResource -ResourceGroupName $RG.ResourceGroupName
        foreach ($resource in $resources)
        {
            # Tag the Resources in the Resource Group
            if($resource.tags -eq $NULL)
            {
                Set-AzureRmResource -Tag @{ Department="MI"; Environment="PROD" } -ResourceId $resource.ResourceId -Force
            }
            else
            {    
                if($resource.tags.Department -eq $NULL)
                {
                    $Resource.Tags.Add("Department", "MI")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
                if($resource.tags.Environment -eq $NULL)
                {
                    $Resource.Tags.Add("Environment", "PROD")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
            }
            
        }
    }
    if($RG.ResourceGroupName -like "*DR*")
    {
        # Tag the Resource Group
        if($RG.tags -eq $NULL)
        {
            Set-AzureRmResource -Tag @{ Department="MI"; Environment="DR" } -ResourceId $RG.ResourceId -Force
        }
        else
        {
            if($RG.tags.Department -eq $NULL)
            {
                $RG.Tags.Add("Department", "MI")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }
            if($RG.tags.Environment -eq $NULL)
            {
                $RG.Tags.Add("Environment", "DR")
                Set-AzureRmResource -Tag $RG.Tags -ResourceId $RG.ResourceId -Force
            }            
        }
        
        # Collect the Resources
        $resources = Get-AzureRmResource -ResourceGroupName $RG.ResourceGroupName
        foreach ($resource in $resources)
        {
            # Tag the Resources in the Resource Group
            if($resource.tags -eq $NULL)
            {
                Set-AzureRmResource -Tag @{ Department="MI"; Environment="DR" } -ResourceId $resource.ResourceId -Force
            }
            else
            {    
                if($resource.tags.Department -eq $NULL)
                {
                    $Resource.Tags.Add("Department", "MI")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
                if($resource.tags.Environment -eq $NULL)
                {
                    $Resource.Tags.Add("Environment", "DR")
                    Set-AzureRmResource -Tag $Resource.Tags -ResourceId $resource.ResourceId -Force
                }
            }
            
        }
    }
}