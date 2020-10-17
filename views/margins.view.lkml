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
    value_format: "0\%"
    type: number
  }
  dimension: trump_avg {
    label: "Polls Trump Average"
    value_format: "0\%"
    type: number
  }
  dimension: net_biden {
    type: number
    sql: round(${biden_avg}-${trump_avg}) ;;
    value_format: "0\%"
  }
  dimension: marginal_bins {
    type: tier
    tiers: [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]
    style: integer
    sql: CAST(${net_biden} AS INT64) ;;
    value_format: "0\%"
  }
  dimension: pk {
  primary_key: yes
  }
  measure: count {
    type: count
  }
  measure: total {
    type: number
    sql: IF(${biden_win}+${trump_win}>0, ${biden_win}+${trump_win}, 1) ;;
  }
  measure: biden_win {
    type: sum
    sql: CASE
          WHEN ${net_biden} >= 0 THEN 1
          ELSE null
    END ;;
  }
  measure: trump_win {
    type: sum
    sql: CASE
          WHEN ${net_biden} <= 0 THEN 1
          ELSE null
    END ;;
  }
  measure: prob_biden {
    type: number
    sql: ${biden_win}/${total} ;;
    value_format: "0%"
  }
  measure: prob_trump {
    type: number
    sql: ${trump_win}/${total} ;;
    value_format: "0%"
  }
  measure: forecast {
    type: string
    sql: CASE
    WHEN ${fq_margin} >= 0 THEN '1 Solid Biden'
    WHEN ${fq_margin} < 0 AND ${median_margin} > 0 THEN '2 Lean Biden'
    WHEN ${tq_margin} > 0 AND ${median_margin} < 0 THEN '4 Lean Trump'
    WHEN ${tq_margin} <= 0 THEN '5 Solid Trump'
    WHEN ${median_margin} = 0 THEN '3 Tossup'
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
    value_format: "0\%"
  }
  measure: min_margin {
    type: min
    value_format: "0\%"
    sql: ${net_biden} ;;
  }
  measure: max_margin {
    type: max
    value_format: "0\%"
    sql: ${net_biden} ;;
  }
  measure: median_margin {
    type: median
    value_format: "0\%"
    sql: ${net_biden} ;;
  }
  measure: fq_margin {
    type: percentile
    percentile: 25
    value_format: "0\%"
    sql: ${net_biden} ;;
  }
  measure: tq_margin {
    type: percentile
    percentile: 75
    value_format: "0\%"
    sql: ${net_biden} ;;
  }
}
