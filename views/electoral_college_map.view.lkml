view: electoral_college_map {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.electoral_college_map`
    ;;
  dimension: state {
    primary_key: yes
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.State ;;
    tags: ["Test", "Please", "ignore", "🐈"]
  }

  dimension: votes {
    type: number
    sql: ${TABLE}.Votes ;;
  }

  dimension: closing {
    type: number
    sql: ${TABLE}.closing_time ;;
  }

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.Abbreviation ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum {
    type: sum
    sql: ${votes} ;;
    drill_fields: [state, margins.min_margin, margins.fq_margin, margins.median_margin, margins.tq_margin, margins.max_margin, forecast_lookup.forecast]
  }
}
