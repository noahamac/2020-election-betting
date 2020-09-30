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
  dimension: pk {

  }
  parameter: observed {
    type: number
    allowed_value: {
      label: "No Observed"
      value: "0.0"
    }
    allowed_value: {
      label: "1% Toward Biden"
      value: "-1"
    }
    allowed_value: {
      label: "0.5% Toward Biden"
      value: "-0.5"
    }
    allowed_value: {
      label: "1% Toward Trump"
      value: "1"
    }
    allowed_value: {
      label: "0.5% Toward Trump"
      value: "0.5"
    }
  }
  measure: forecast {
    type: string
    sql: CASE
    WHEN ${fq_margin} >= 0 THEN '1 Solid Biden'
    WHEN ${fq_margin} <= 0 AND ${median_margin} > 0 THEN '2 Lean Biden'
    WHEN ${tq_margin} >= 0 AND ${median_margin} < 0 THEN '4 Lean Trump'
    WHEN ${tq_margin} <= 0 THEN '5 Solid Trump'
    WHEN ${tq_margin} = 0 THEN '3 True Tossup'
    ELSE '6 No Polling'
    END ;;
  }
  measure: rough_forecast {
    type: string
    sql: CASE
          WHEN ${forecast} = '1 Solid Biden' THEN '1 Biden'
          WHEN ${forecast} = '2 Lean Biden' THEN '1 Biden'
          WHEN ${forecast} = '4 Lean Trump' THEN '3 Trump'
          WHEN ${forecast} = '5 Solid Trump' THEN '3 Trump'
          WHEN ${forecast} = '6 No Polling' THEN '4 Trump'
          ELSE '2 Tossup'
          END ;;
  }
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
