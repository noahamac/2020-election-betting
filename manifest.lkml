project_name: "2020-election-betting"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# test change pls ignore
local_dependency: {
  project: "data-block-acs-census-bigquery"
  override_constant: CONNECTION_NAME {
    value: "brick-layer"
  }
}
