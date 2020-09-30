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
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
