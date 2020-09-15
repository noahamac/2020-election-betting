view: margins {
  derived_table: {
    explore_source: polls {
      column: pk {}
      column: notes {}
      column: biden_avg {}
      column: trump_avg {}
      filters: {
        field: polls.trump_avg
        value: "NOT NULL"
      }
      filters: {
        field: polls.biden_avg
        value: "NOT NULL"
      }
    }
  }
  dimension: pk {}
  dimension: notes {}
  dimension: true_pk {
    sql: CONCAT(${pk},":",${notes}) ;;
    primary_key: yes
  }
  dimension: biden_avg {
    value_format: "0.0\%"
    type: number
  }
  dimension: trump_avg {
    value_format: "0.0\%"
    type: number
  }

  measure: average_margin {
    type: average_distinct
    sql: ${biden_avg}-${trump_avg} ;;
    value_format: "0.0\%"
    drill_fields: [pk]
  }
}
