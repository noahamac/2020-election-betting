view: fivethirtyeight_state {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.fivethirtyeight_state`
    ;;

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: candidate_3rd {
    type: string
    sql: ${TABLE}.candidate_3rd ;;
  }

  dimension: candidate_chal {
    type: string
    sql: ${TABLE}.candidate_chal ;;
  }

  dimension: candidate_inc {
    type: string
    sql: ${TABLE}.candidate_inc ;;
  }

  dimension: cycle {
    type: number
    sql: ${TABLE}.cycle ;;
  }

  dimension: margin {
    type: number
    sql: ${TABLE}.margin ;;
  }

  dimension: margin_hi {
    type: number
    sql: ${TABLE}.margin_hi ;;
  }

  dimension: margin_lo {
    type: number
    sql: ${TABLE}.margin_lo ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension_group: modeldate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.modeldate ;;
  }

  dimension: simulations {
    type: number
    sql: ${TABLE}.simulations ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_turnout {
    type: number
    sql: ${TABLE}.state_turnout ;;
  }

  dimension: state_turnout_hi {
    type: number
    sql: ${TABLE}.state_turnout_hi ;;
  }

  dimension: state_turnout_lo {
    type: number
    sql: ${TABLE}.state_turnout_lo ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: tipping {
    type: number
    sql: ${TABLE}.tipping ;;
  }

  dimension: voteshare_3rd {
    type: string
    sql: ${TABLE}.voteshare_3rd ;;
  }

  dimension: voteshare_3rd_hi {
    type: string
    sql: ${TABLE}.voteshare_3rd_hi ;;
  }

  dimension: voteshare_3rd_lo {
    type: string
    sql: ${TABLE}.voteshare_3rd_lo ;;
  }

  dimension: voteshare_chal {
    type: number
    sql: ${TABLE}.voteshare_chal ;;
  }

  dimension: voteshare_chal_hi {
    type: number
    sql: ${TABLE}.voteshare_chal_hi ;;
  }

  dimension: voteshare_chal_lo {
    type: number
    sql: ${TABLE}.voteshare_chal_lo ;;
  }

  dimension: voteshare_inc {
    type: number
    sql: ${TABLE}.voteshare_inc ;;
  }

  dimension: voteshare_inc_hi {
    type: number
    sql: ${TABLE}.voteshare_inc_hi ;;
  }

  dimension: voteshare_inc_lo {
    type: number
    sql: ${TABLE}.voteshare_inc_lo ;;
  }

  dimension: voteshare_other {
    type: number
    sql: ${TABLE}.voteshare_other ;;
  }

  dimension: voteshare_other_hi {
    type: number
    sql: ${TABLE}.voteshare_other_hi ;;
  }

  dimension: voteshare_other_lo {
    type: number
    sql: ${TABLE}.voteshare_other_lo ;;
  }

  dimension: vpi {
    type: number
    sql: ${TABLE}.vpi ;;
  }

  dimension: win_ec_if_win_state_chal {
    type: number
    sql: ${TABLE}.win_EC_if_win_state_chal ;;
  }

  dimension: win_ec_if_win_state_inc {
    type: number
    sql: ${TABLE}.win_EC_if_win_state_inc ;;
  }

  dimension: win_state_if_win_ec_chal {
    type: number
    sql: ${TABLE}.win_state_if_win_EC_chal ;;
  }

  dimension: win_state_if_win_ec_inc {
    type: number
    sql: ${TABLE}.win_state_if_win_EC_inc ;;
  }

  dimension: winstate_3rd {
    type: string
    sql: ${TABLE}.winstate_3rd ;;
  }

  dimension: winstate_chal {
    type: number
    sql: ${TABLE}.winstate_chal ;;
  }

  dimension: winstate_inc {
    type: number
    sql: ${TABLE}.winstate_inc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
