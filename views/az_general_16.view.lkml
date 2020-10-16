view: az_general_16 {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.az_general_16`
    ;;

  dimension: clinton {
    type: number
    sql: ${TABLE}.CLINTON ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: johnson {
    type: number
    sql: ${TABLE}.JOHNSON ;;
  }

  dimension: stein {
    type: number
    sql: ${TABLE}.STEIN ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: trump {
    type: number
    sql: ${TABLE}.TRUMP ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
