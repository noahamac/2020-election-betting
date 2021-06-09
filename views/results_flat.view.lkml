view: results_flat {
  # derived_table: {
  #   explore_source: results {
  #     column: state {}
  #     column: county {}
  #     column: pk {}
  #     column: biden_votes {}
  #     column: trump_votes {}
  #     column: total {}
  #   }
  # }
  dimension: state {}
  dimension: pk {
    primary_key: yes
  }
  dimension: county {}
  measure: biden_votes {
    value_format: "0"
    type: sum
  }
  measure: trump_votes {
    value_format: "0"
    type: sum
  }
  measure: total {
    type: sum
  }
  measure: biden_win_pct {
    type: number
    sql: ${biden_votes} / ${total} ;;
  }
  measure: trump_win_pct {
    type: number
    sql: ${trump_votes} / ${total} ;;
  }
  measure: mov {
    type: number
    sql: ${biden_win_pct} -  ${trump_win_pct} ;;
  }
}
