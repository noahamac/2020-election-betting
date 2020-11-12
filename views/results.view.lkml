view: results {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.results`
    ;;

  dimension: biden {
    type: number
    sql: ${TABLE}.Biden ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: estimated_votes_in {
    type: string
    sql: ${TABLE}.Estimated_Votes_in ;;
  }

  dimension: jorgensen {
    type: number
    sql: ${TABLE}.Jorgensen ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(${county}, " County,", ${state}) ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }

  dimension: trump {
    type: number
    sql: ${TABLE}.Trump ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: biden_votes {
    type: sum
    value_format: "0"
    sql: ${biden} * ${total} ;;
  }

  measure: trump_votes {
    type: sum
    value_format: "0"
    sql: ${trump} * ${total} ;;
  }

  measure: mov {
    type: number
    sql: ${biden_votes} - ${trump_votes} ;;
  }
}
