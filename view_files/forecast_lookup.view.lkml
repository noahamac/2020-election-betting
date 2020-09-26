view: forecast_lookup {
  derived_table: {
    explore_source: polls {
      column: state {}
      column: forecast { field: margins.forecast }
    }
  }
  dimension: state {}
  dimension: forecast {
    type: string
  }
  dimension: forecast_index {
    type: number
    sql: SPLIT(${forecast}, " ")[0] ;;
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
