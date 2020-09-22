# If necessary, uncomment the line below to include explore_source.
# include: "2020-election-betting.model.lkml"

view: margins {
  derived_table: {
    explore_source: polls {
      column: biden_avg {}
      column: trump_avg {}
      column: pk {}
      filters: {
        field: polls.biden_avg
        value: "NOT NULL"
      }
      filters: {
        field: polls.trump_avg
        value: "NOT NULL"
      }
    }
  }
  dimension: biden_avg {
    label: "Polls Biden Average"
    value_format: "0.0\%"
    type: number
  }
  dimension: trump_avg {
    label: "Polls Trump Average"
    value_format: "0.0\%"
    type: number
  }
  dimension: net_biden {
    type: number
    sql: ${biden_avg}-${trump_avg} ;;
    value_format: "0.0\%"
  }
  dimension: pk {}
  measure: avg_biden_margin {
    type: average
    sql: ${net_biden} ;;
    value_format: "0.0\%"
  }
  measure: min_margin {
    type: min
    value_format: "0.0\%"
    sql: ${net_biden} ;;
  }
  measure: max_margin {
    type: max
    value_format: "0.0\%"
    sql: ${net_biden} ;;
  }
  measure: median_margin {
    type: median
    value_format: "0.0\%"
    sql: ${net_biden} ;;
  }
  measure: fq_margin {
    type: percentile
    percentile: 25
    value_format: "0.0\%"
    sql: ${net_biden} ;;
  }
  measure: tq_margin {
    type: percentile
    percentile: 75
    value_format: "0.0\%"
    sql: ${net_biden} ;;
  }
}
