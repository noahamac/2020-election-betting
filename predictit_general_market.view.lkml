view: predictit_general_market {
  sql_table_name: `spencer-white-tckt87992.2020electionbetting.markets`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: best_buy_no_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.BestBuyNoCost ;;
  }

  dimension: best_buy_no_cost__xsi_nil {
    hidden: yes
    type: yesno
    sql: ${TABLE}.BestBuyNoCost__xsi_nil ;;
  }

  dimension: best_buy_yes_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.BestBuyYesCost ;;
  }

  dimension: best_sell_no_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.BestSellNoCost ;;
  }

  dimension: best_sell_yes_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.BestSellYesCost ;;
  }

  dimension: best_sell_yes_cost__xsi_nil {
    hidden: yes
    type: yesno
    sql: ${TABLE}.BestSellYesCost__xsi_nil ;;
  }

  dimension: date_end {
    hidden: yes
    type: string
    sql: ${TABLE}.DateEnd ;;
  }

  dimension: display_order {
    hidden: yes
    type: number
    sql: ${TABLE}.DisplayOrder ;;
  }

  dimension: image {
    hidden: yes
    type: string
    sql: ${TABLE}.Image ;;
  }

  dimension: last_close_price {
    hidden: yes
    type: number
    sql: ${TABLE}.LastClosePrice ;;
  }

  dimension: last_trade_price {
    type: number
    sql: ${TABLE}.LastTradePrice ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.ShortName ;;
  }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.Status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, short_name, name]
  }
}
