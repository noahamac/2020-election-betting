connection: "brick-layer"

include: "/view_files/*.view.lkml"                # include all views in the views/ folder in this project

explore: polls {
  from: 538_general_polls

  join: predictit_general_market {
    relationship: many_to_one
    sql_on: ${polls.campaign} = ${predictit_general_market.short_name} ;;
  }

  join: electoral_college_map {
    relationship: many_to_one
    sql_on: ${polls.state} = ${electoral_college_map.state} ;;
  }

  join: margins {
    relationship: one_to_one
    sql_on: ${polls.pk} = ${margins.pk} ;;
  }
}
