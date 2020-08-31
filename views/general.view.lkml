view: 538_general_polls {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.general`
    ;;

  dimension: campaign {
    type: string
    sql: ${TABLE}.answer ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: number
    sql: ${TABLE}.candidate_id ;;
  }

  dimension: candidate_name {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_name ;;
  }

  dimension: candidate_party {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_party ;;
  }

  dimension_group: created {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: cycle {
    hidden: yes
    type: number
    sql: ${TABLE}.cycle ;;
  }

  dimension: pollster {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension_group: election {
    hidden: yes
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
    sql: ${TABLE}.election_date ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: pollster_rating {
    type: string
    sql: ${TABLE}.fte_grade ;;
  }

  dimension: internal {
    type: yesno
    sql: ${TABLE}.internal ;;
  }

  dimension: methodology {
    type: string
    sql: ${TABLE}.methodology ;;
  }

  dimension: nationwide_batch {
    hidden: yes
    type: yesno
    sql: ${TABLE}.nationwide_batch ;;
  }

  dimension: notes {
    hidden: yes
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: office_type {
    hidden: yes
    type: string
    sql: ${TABLE}.office_type ;;
  }

  dimension: partisan {
    hidden: yes
    type: string
    sql: ${TABLE}.partisan ;;
  }

  dimension: pct {
    type: number
    sql: ${TABLE}.pct ;;
  }

  dimension: poll_id {
    type: number
    sql: ${TABLE}.poll_id ;;
  }

  dimension: pollster_long {
    hidden: yes
    type: string
    sql: ${TABLE}.pollster ;;
  }

  dimension: pollster_id {
    hidden: yes
    type: number
    sql: ${TABLE}.pollster_id ;;
  }

  dimension: pollster_rating_id {
    hidden: yes
    type: number
    sql: ${TABLE}.pollster_rating_id ;;
  }

  dimension: pollster_rating_name {
    hidden: yes
    type: string
    sql: ${TABLE}.pollster_rating_name ;;
  }

  dimension: population {
    type: string
    sql: ${TABLE}.population ;;
  }

  dimension: population_full {
    type: string
    sql: ${TABLE}.population_full ;;
  }

  dimension: question_id {
    hidden: yes
    type: number
    sql: ${TABLE}.question_id ;;
  }

  dimension: race_id {
    hidden: yes
    type: number
    sql: ${TABLE}.race_id ;;
  }

  dimension: ranked_choice_reallocated {
    hidden: yes
    type: yesno
    sql: ${TABLE}.ranked_choice_reallocated ;;
  }

  dimension: sample_size {
    type: number
    sql: ${TABLE}.sample_size ;;
  }

  dimension: seat_name {
    hidden: yes
    type: string
    sql: ${TABLE}.seat_name ;;
  }

  dimension: seat_number {
    hidden: yes
    type: number
    sql: ${TABLE}.seat_number ;;
  }

  dimension: sponsor_candidate {
    type: string
    sql: ${TABLE}.sponsor_candidate ;;
  }

  dimension: sponsor_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.sponsor_ids ;;
  }

  dimension: sponsors {
    hidden: yes
    type: string
    sql: ${TABLE}.sponsors ;;
  }

  dimension: stage {
    hidden: yes
    type: string
    sql: ${TABLE}.stage ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: tracking {
    type: yesno
    sql: ${TABLE}.tracking ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [candidate_name, pollster, seat_name, pollster_rating_name]
  }

  measure: biden_avg {
    type: average
    sql: ${pct} ;;
    filters: [campaign: "Biden"]
  }

  measure: Trump_avg {
    type: average
    sql: ${pct} ;;
    filters: [campaign: "Trump"]
  }
}
