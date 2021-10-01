view: account {
  # sql_table_name: anz_poc.wh_denormalised ;;
  sql_table_name: `anz_poc.wh_denormalised_cleansed_history` ;;

#############CONTROL##################

  dimension_group: reporting_day {
    type: time
    timeframes: [year, quarter, month, date]
    sql: TIMESTAMP(${TABLE}.control.reporting_day) ;;
  }

#############ACCOUNT##################
  dimension: entity {
    group_label: "Account"
    sql: ${TABLE}.account.entity_code ;;
  }
  dimension: account_number {
    group_label: "Account"
    sql: ${TABLE}.account.account_number ;;

    link: {
      label: "Link to Account"
      url: "https://www.anz.com.au"
      icon_url: "http://www.google.com/s2/favicons?domain=anz.com.au"
    }

    link: {
      label: "View Account History"
      url: "/dashboards-next/1007?Account%20Number={{value}}"
      icon_url: "http://www.google.com/s2/favicons?domain=looker.com"
    }

  }
  dimension: account_status {
    group_label: "Account"
    sql: ${TABLE}.account.account_status ;;
  }
  dimension: account_balance {
    group_label: "Account"
    type:number
    sql: ${TABLE}.account.account_balance ;;
    value_format_name: usd_0

    action: {
      label: "Suggest Adjustment"
      url: "https://hooks.zapier.com/hooks/catch/2813548/oosxkej/"
      icon_url: "http://www.google.com/s2/favicons?domain=anz.com.au"
      #^sample of sending to server with custom form that can accept JSON POST

      form_param: {
        name: "Name"
        type: string
        default: "{{ _user_attributes.first_name}} {{ _user_attributes.last_name}}"
      }

      form_param: {
        name: "Email"
        type: string
        default: "{{ _user_attributes.email }}"
      }

      form_param: {
        name: "Old Value"
        type: string
        default: "{{ total_account_balance._rendered_value }}"
      }

      form_param: {
        name: "Suggested New Value"
        type: string
      }

      form_param: {
        name: "Comments"
        type: textarea
        default: " Hi, I believe exposure for Account Number {{account_number._value }} should be adjusted due to a manual adjustment in our trades as a result of a market adjustment on January 13th. See memo XYZ for more details."
      }
    }
  }
  dimension: days_delinquent {
    group_label: "Account"
    type: number
    sql: ${TABLE}.account.days_delinquent;;
  }
  dimension: days_delinquent_tier {
    group_label: "Account"
    type: tier
    tiers: [15,30,45,60,90,120]
    style: integer
    sql: ${days_delinquent} ;;
  }

  dimension: dpd_banding_extended {
    group_label: "Account"
    type:number
    # sql: ${TABLE}.account.dpd_banding_extended;;
    sql: ${TABLE}.account.became days_delinquent_bucket ;;
  }
  dimension: npl_flag  {
    group_label: "Account"
    type:yesno
    sql: ${TABLE}.account.npl_flag ;;
  }
  dimension_group: date_opened {
    group_label: "Account"
    timeframes: [year, quarter, month, date]
    type: time
    sql: TIMESTAMP(${TABLE}.account.date_opened) ;;
  }
  # dimension: payment_type_dynamic {
  #   group_label: "Account"
  #   sql: ${TABLE}.account.payment_type_dynamic ;;
  # }
  # dimension: payment_type_static {
  #   group_label: "Account"
  #   sql:  ${TABLE}.account.payment_type_static;;
  # }
  dimension: property_state {
    group_label: "Account"
    sql: ${TABLE}.primary_security.property_state ;;
    # sql: ${TABLE}.account.state ;;
    # drill_fields: [region_type]
  }
  # dimension: region_type {
  #   group_label: "Account"
  #   sql: ${TABLE}.account.region_type ;;
  # }
  # dimension: channel_type {
  #   group_label: "Account"
  #   sql: ${TABLE}.account.channel_type ;;
  # }
  # dimension: document_type {
  #   group_label: "Account"
  #   sql: ${TABLE}.account.document_type ;;
  # }
  # dimension: interest_rate_type {
  #   group_label: "Account"
  #   sql: ${TABLE}.account.interest_rate_type ;;
  # }
  # dimension: lvr {
  #   group_label: "Account"
  #   sql: ${TABLE}.account.lvr ;;
  # }
  measure: total_account_balance {
    # group_label: "Account"
    type: sum
    sql: ${account_balance} ;;
    value_format_name: usd_0
    drill_fields: [account_details*]

  }
  measure: delinquent_90 {
    # group_label: "Account"
    type: count
    filters: [days_delinquent: ">=90"]
  }
  measure: count {
    label: "Total Accounts"
    # group_label: "Account"
    type:count_distinct
    sql: ${account_number} ;;
    drill_fields: [account_details*]
  }

  parameter: delinquency_threshold {
    description: "Select # of days deliquent to calculate delinquency rate dynamically; defaults to 90 days"
    type: number
    default_value: "90"
    allowed_value: {
      label: "30-Day Deliquency"
      value: "30"
    }
    allowed_value: {
      label: "45-Day Deliquency"
      value: "45"
    }
    allowed_value: {
      label: "60-Day Deliquency"
      value: "60"
    }
    allowed_value: {
      label: "90-Day Deliquency"
      value: "90"
    }
  }

  dimension: is_delinquent {
    group_label: "Account"
    description: "Use with Deliquency Threshold paramter to dynamically calculate deliquency rate"
    type: yesno
    sql: ${days_delinquent} >= {% parameter delinquency_threshold %};;
  }

  measure: dynamic_delinquent_total {
    label: "Total Delinquencies"
    # group_label: "Account"
    description: "Use with Deliquency Threshold paramter to dynamically calculate deliquency rate"
    type: count_distinct
    sql: ${account_number} ;;
    filters: [is_delinquent: "Yes"]
    drill_fields: [account_details*]
  }

  measure: dynamic_delinquency_rate {
    # group_label: "Account"
    description: "Use with Deliquency Threshold paramter to dynamically calculate deliquency rate"
    label_from_parameter: delinquency_threshold
    type:number
    sql: 1.0*${dynamic_delinquent_total} / nullif(${count},0) ;;
    value_format_name: percent_2
    drill_fields: [property_state, count, dynamic_delinquency_rate]
  }

#############PRODUCT##################
  # dimension: product_id {
  #   group_label: "Product"
  #   sql: ${TABLE}product.product_id ;;
  # }
  dimension: product_code {
    group_label: "Product"
    sql: ${TABLE}.product.product_code ;;
  }
  # dimension: product_type {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.product_type ;;
  # }
  dimension: product_description {
    group_label: "Product"
    sql: ${TABLE}.product.description ;;
    # sql: ${TABLE}.product.sub_product ;;
  }
  # dimension: product_description {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.product_description ;;
  # }
  # dimension: product_class {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.product_class ;;
  # }
  dimension: limit_type {
    group_label: "Product"
    sql: ${TABLE}.product.limit_type ;;
  }
  # dimension: rate_type {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.rate_type ;;
  # }
  # dimension: grouping {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.grouping ;;
  # }
  # dimension: group_name {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.group_name ;;
  # }
  dimension: active_flag {
    group_label: "Product"
    sql: ${TABLE}.product.active_flag ;;
  }
  # dimension: reporting_group {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.reporting_group ;;
  # }
  # dimension: offset {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.offset ;;
  # }
  # dimension: a_c {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.a_c ;;
  # # }
  # dimension: category {
  #   group_label: "Product"
  #   sql: ${TABLE}.product.category ;;
  #   # drill_fields: [rate_type]
  # }

########################PLANNING#################
  # dimension: forecast_balance {
  #   group_label: "Planning"
  #   sql: ${TABLE}.planning.forecast_balance ;;
  # }
  # dimension: budget {
  #   group_label: "Planning"
  #   sql: ${TABLE}.planning.budget ;;
  # }
  # dimension: ip_charge_actual {
  #   group_label: "Planning"
  #   sql: ${TABLE}.planning.ip_charge_actual ;;
  # }
  # dimension: cp_charge_actual {
  #   group_label: "Planning"
  #   sql: ${TABLE}.planning.cp_charge_actuale ;;
  # }
  dimension: provision_amount {
    group_label: "Planning"
    sql: ${TABLE}.planning.provision_amount ;;
  }
  # dimension: GLA {
  #   group_label: "Planning"
  #   sql: ${TABLE}.planning.GLA ;;
  # }

  ## SETS ##

  set: account_details {
    fields: [account_number, product_description, product_description, property_state, account_balance]
  }

}
