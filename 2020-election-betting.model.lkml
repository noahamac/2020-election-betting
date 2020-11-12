include: "/views/*.view.lkml"
include: "//data-block-acs-census-bigquery/*"

explore: polls {
  description: "This explore should be used to analyze 2020 polling data from a 538 data source base."
  from: general_polls

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
    sql_on: ${polls.state} = ${rough_forecast_lookup.state} ;;
  }
  join: niskanen {
    relationship: one_to_one
    sql_on: ${electoral_college_map.abbreviation} = ${niskanen.abbreviation} ;;
  }
}

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
}

explore: results {}

explore: +congressional_district {
  always_join: [niskanen]
  join: general_polls {
    relationship: one_to_many
    sql_on: ${state.state_name} = ${general_polls.state} ;;
  }
  join: margins {
    relationship: one_to_one
    sql_on: ${general_polls.pk} = ${margins.pk} ;;
  }
  join: forecast_lookup {
    relationship: one_to_one
    sql_on: ${state.state_abbreviation} = ${forecast_lookup.abbreviation} ;;
  }
  join: niskanen {
    relationship: one_to_one
    sql_on: ${state.state_abbreviation} = ${niskanen.abbreviation} ;;
  }
}


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
explore: +places {
  hidden: yes
}
explore: +cbsa {
  hidden: yes
}
explore: +zcta {
  hidden: yes
}
explore: +school_districts_unified {
  hidden: yes
}
explore: +school_districts_elementary {
  hidden: yes
}
explore: +school_districts_secondary {
  hidden: yes
}
explore: +puma {
  hidden: yes
}
