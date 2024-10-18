# resource "databricks_cluster_policy" "spot_instances" {
#   name       = "Spot instances cluster policy"
#   definition = jsonencode(local.default_policy)
# }

# locals {
#   default_policy = {
#     "azure_attributes.availability" : {
#       "type" : "fixed",
#       "value" : "SPOT_WITH_FALLBACK_AZURE",
#       "hidden" : true
#     },
#     "cluster_type" : {
#       "type" : "fixed",
#       "value" : "job"
#     }
#   }
# }
