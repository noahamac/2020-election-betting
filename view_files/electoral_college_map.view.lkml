view: electoral_college_map {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.electoral_college_map`
    ;;

  dimension: state {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.Votes ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
