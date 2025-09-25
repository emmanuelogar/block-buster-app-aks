resource "azurerm_resource_group" "tf_rg" {
  name     = "tfstate"
  location = "eastus"
}

resource "azurerm_storage_account" "blobfusecontainer" {
  name                     = "tfstate14273"
  resource_group_name      = azurerm_resource_group.tf_rg.name
  location                 = azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "blobfuse" {
  name                  = "blobfuse"
  storage_account_id    = azurerm_storage_account.blobfusecontainer.id
  container_access_type = "private"
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = "tws-k8s-cluster"
  resource_group_name = "tws-aks-cluster-rg"
}

resource "azurerm_role_assignment" "aks_blob_owner" {
  scope                = azurerm_storage_account.blobfusecontainer.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_kubernetes_cluster.aks.identity[0].principal_id
}
