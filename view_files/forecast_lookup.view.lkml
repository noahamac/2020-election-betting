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
}
