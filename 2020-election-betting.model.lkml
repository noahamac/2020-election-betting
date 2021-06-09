include: "/views/*.view.lkml"
include: "//data-block-acs-census-bigquery/*"
include: "//data-block-acs-census-bigquery/explores/acs_census_data.explore"
include: "//data-block-acs-census-bigquery/geography/*"

explore: polls {
  description: "This explore should be used to analyze 2020 polling data from a 538 data source base."
  from: general_polls

  query: count_polls_by_month {
    dimensions: [polls.start_month]
    measures: [polls.count_polls]
  }

  join: predictit_general_market {
    relationship: many_to_one
    sql_on: ${polls.campaign} = ${predictit_general_market.short_name} ;;
  }

  join: electoral_college_map {
    relationship: many_to_one
    sql_on: ${polls.state} = ${electoral_college_map.state} ;;
  }

  join: margins {
    relationship: one_to_one
    sql_on: ${polls.pk} = ${margins.pk} ;;
  }

  join: forecast_lookup {
    relationship: one_to_one
    sql_on: ${electoral_college_map.abbreviation} = ${forecast_lookup.abbreviation} ;;
  }

  join: rough_forecast_lookup {
    relationship: one_to_one
    type: cross
    sql_on: ${polls.state} = ${rough_forecast_lookup.state} ;;
  }
  join: niskanen {
    relationship: one_to_one
    sql_on: ${electoral_college_map.abbreviation} = ${niskanen.abbreviation} ;;
  }
}

# explore: order_items {}

# explore: polling {
#   join: forecast {
#     relationship: one_to_one
#     sql_on: ${polling.pk} = ${forecast.pk} ;;
#   }
# }

explore: ecmap {
  description: "This explore should be used when analyzing the US Electoral College in Looker. Various forecasting models, polling measures, and more are included."
  label: "Electoral College Map"
  always_join: [niskanen]
  from: electoral_college_map
  join: general_polls {
    relationship: one_to_many
    sql_on: ${ecmap.state} = ${general_polls.state} ;;
  }
  join: margins {
    relationship: one_to_one
    sql_on: ${general_polls.pk} = ${margins.pk} ;;
  }
  join: forecast_lookup {
    relationship: one_to_one
    sql_on: ${ecmap.abbreviation} = ${forecast_lookup.abbreviation} ;;
  }
  join: niskanen {
    relationship: one_to_one
    sql_on: ${ecmap.abbreviation} = ${niskanen.abbreviation} ;;
  }
  join: fivethirtyeight_state {
    relationship: one_to_many
    sql_on: ${ecmap.state} = ${fivethirtyeight_state.state} ;;
  }
  join: results_flat {
    relationship: many_to_many
    sql_on: ${results_flat.state} = ${ecmap.abbreviation} ;;
  }
}

# explore: results {}
# explore: results_flat {
#   always_join: [state]
#   join: state {
#     relationship: many_to_many
#     sql_on: ${results_flat.state} = ${state.state_abbreviation} ;;
#   }
#   join: county {
#     relationship: many_to_many
#     sql_on: ${results_flat.pk} = CONCAT(${county.county_name}, ",", ${state.state_abbreviation}) ;;
#   }
# }

# explore: +congressional_district {
#   always_join: [niskanen]
#   join: general_polls {
#     relationship: one_to_many
#     sql_on: ${state.state_name} = ${general_polls.state} ;;
#   }
#   join: margins {
#     relationship: one_to_one
#     sql_on: ${general_polls.pk} = ${margins.pk} ;;
#   }
#   join: forecast_lookup {
#     relationship: one_to_one
#     sql_on: ${state.state_abbreviation} = ${forecast_lookup.abbreviation} ;;
#   }
#   join: niskanen {
#     relationship: one_to_one
#     sql_on: ${state.state_abbreviation} = ${niskanen.abbreviation} ;;
#   }
# }


explore: +acs_census_data_core {
  join: az_general_16 {
    relationship: one_to_one
    sql_on: ${az_general_16.county} = ${county.county_name} ;;
  }
  join: general_polls {
    relationship: one_to_many
    sql_on: ${state.state_name} = ${general_polls.state} ;;
  }
  join: margins {
    relationship: one_to_one
    sql_on: ${general_polls.pk} = ${margins.pk} ;;
  }
}
# explore: +places {
#   hidden: yes
# }
# explore: +cbsa {
#   hidden: yes
# }
# explore: +zcta {
#   hidden: yes
# }
# explore: +school_districts_unified {
#   hidden: yes
# }
# explore: +school_districts_elementary {
#   hidden: yes
# }
# explore: +school_districts_secondary {
#   hidden: yes
# }
# explore: +puma {
#   hidden: yes
# }

# explore: electoral_college_map {
#   join: niskanen {
#     type: left_outer
#     sql_on: ${electoral_college_map.abbreviation} = ${niskanen._2008} ;;
#   }
#   join: niskanen_other {
#     from: niskanen
#     type: inner
#     sql_on: ${electoral_college_map.state} = ${niskanen.negative_partisanship} ;;
#   }
#   join: niskanen_cross {
#     from: niskanen
#     type: cross
#     sql_on: ${electoral_college_map.votes} = ${niskanen.trump_prob} ;;
#   }
#   join: niskaknen_full {
#     from: niskanen
#     type: full_outer
#     sql_on: ${electoral_college_map.closing} = ${niskanen.biden_prob} ;;
#   }
# }
