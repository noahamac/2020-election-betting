view: forecast_lookup {
  derived_table: {
    explore_source: ecmap {
      column: abbreviation {}
      column: poll_forecast { field: margins.forecast }
      column: niskanen_forecast { field: niskanen.call }
    }
  }
  dimension: abbreviation {}
  dimension: poll_forecast {
    type: string
  }
  dimension: niskanen_forecast {
    type: string
  }
  dimension: forecast_index {
    type: number
    sql: SPLIT(${forecast}, " ")[OFFSET(0)] ;;
  }
  dimension: niskanen_bridge {
    type: string
    sql: CASE
          WHEN ${niskanen_forecast} = "safe_d" THEN "1 Solid Biden"
          WHEN ${niskanen_forecast} = "likely_d" THEN "2 Lean Biden"
          WHEN ${niskanen_forecast} = "tossup" THEN "3 Tossup"
          WHEN ${niskanen_forecast} = "likely_r" THEN "4 Lean Trump"
          WHEN ${niskanen_forecast} = "safe_r" THEN "5 Solid Trump"
          END ;;
  }
  dimension: forecast {
    type: string
    sql: CASE
          WHEN ${poll_forecast} = '6 No Polling' THEN ${niskanen_bridge}
          ELSE ${poll_forecast}
          END ;;
  }
  dimension: rough_forecast {
    type: string
    sql: CASE
    WHEN ${forecast} = '1 Solid Biden' THEN '1 Biden'
    WHEN ${forecast} = '2 Lean Biden' THEN '1 Biden'
    WHEN ${forecast} = '4 Lean Trump' THEN '3 Trump'
    WHEN ${forecast} = '5 Solid Trump' THEN '3 Trump'
    ELSE '2 Tossup'
    END ;;
  }
}

view: rough_forecast_lookup {
  derived_table: {
    explore_source: polls {
      column: state {}
      column: rough_forecast { field: margins.rough_forecast }
    }
  }
  dimension: state {}
  dimension: rough_forecast {
    type: string
  }
}
