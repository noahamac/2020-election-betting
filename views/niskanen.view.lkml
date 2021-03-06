view: niskanen {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.niskanen`
    ;;

  dimension: _2008 {
    type: string
    sql: ${TABLE}._2008 ;;
  }

  dimension: _2012 {
    type: string
    sql: ${TABLE}._2012 ;;
  }

  dimension: _2016 {
    type: string
    sql: ${TABLE}._2016 ;;
  }

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
  }

  dimension: biden_prob {
    type: number
    sql: ${TABLE}.biden_prob ;;
    value_format: "0.0\%"
  }

  measure: real_biden_prob {
    type: min
    sql: ${biden_prob}/100 ;;
    value_format: "0.0%"
  }

  dimension: call {
    type: string
    sql: ${TABLE}.call ;;
  }

  dimension: negative_partisanship {
    type: string
    sql: ${TABLE}.negative_partisanship ;;
  }

  dimension: realignment {
    type: string
    sql: ${TABLE}.realignment ;;
  }

  dimension: trump_prob {
    type: number
    sql: ${TABLE}.trump_prob ;;
    value_format: "0.0\%"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
