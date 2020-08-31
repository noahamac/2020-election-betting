connection: "brick-layer"

include: "/*.view.lkml"                # include all views in the views/ folder in this project

explore: polls {
  from: 538_general_polls
}
