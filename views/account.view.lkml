view: account {
  sql_table_name: anz_poc.wh_denormalised ;;

#############CONTROL##################


  dimension_group: reporting_day {
    type: time
    timeframes: [year, quarter, month, date]
    sql: TIMESTAMP(${TABLE}.control.reporting_day) ;;
  }

#############ACCOUNT##################
  dimension: entity {
    group_label: "Account"
    sql: ${TABLE}.account.entity ;;
  }
  dimension: account_number {
    group_label: "Account"
    sql: ${TABLE}.account.account_number ;;
  }
  dimension: account_status {
    group_label: "Account"
    sql: ${TABLE}.account.account_status ;;
  }
  dimension: account_balance {
    group_label: "Account"
    type:number
    sql: ${TABLE}.account.account_balance ;;
  }
  dimension: days_delinquent {
    group_label: "Account"
    type: number
    sql: ${TABLE}.account.days_delinquent;;
  }
  dimension: dpd_banding_extended {
    group_label: "Account"
    type:number
    sql: ${TABLE}.account.dpd_banding_extended;;
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
  dimension: payment_type_dynamic {
    group_label: "Account"
    sql: ${TABLE}.account.payment_type_dynamic ;;
  }
  dimension: payment_type_static {
    group_label: "Account"
    sql:  ${TABLE}.account.payment_type_static;;
  }
  dimension: state {
    group_label: "Account"
    sql: ${TABLE}.account.state ;;
  }
  dimension: region_type {
    group_label: "Account"
    sql: ${TABLE}.account.region_type ;;
  }
  dimension: channel_type {
    group_label: "Account"
    sql: ${TABLE}.account.channel_type ;;
  }
  dimension: document_type {
    group_label: "Account"
    sql: ${TABLE}.account.document_type ;;
  }
  dimension: interest_rate_type {
    group_label: "Account"
    sql: ${TABLE}.account.interest_rate_type ;;
  }
  dimension: lvr {
    group_label: "Account"
    sql: ${TABLE}.account.lvr ;;
  }
  measure: total_account_balance {
    group_label: "Account"
    type: sum
    sql: ${account_balance} ;;
    value_format_name: usd_0
    drill_fields: [account_number, account_status, interest_rate_type, total_account_balance]
    action: {
      label: "Suggest Adjustment"
      url: "https://hooks.zapier.com/hooks/catch/2813548/oosxkej/"

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
        default: "{{ total_account_balance._value }}"
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
  measure: delinquent_90 {
    group_label: "Account"
    type: count
    filters: [days_delinquent: ">=90"]
  }
  measure: count {
    group_label: "Account"
    type:count
  }

#############PRODUCT##################
  dimension: product_id {
    group_label: "Product"
    sql: ${TABLE}product.product_id ;;
  }
  dimension: product_group {
    group_label: "Product"
    sql: ${TABLE}.product.product_group ;;
  }
  dimension: product_type {
    group_label: "Product"
    sql: ${TABLE}.product.product_type ;;
  }
  dimension: sub_product {
    group_label: "Product"
    sql: ${TABLE}.product.sub_product ;;
  }
  dimension: product_description {
    group_label: "Product"
    sql: ${TABLE}.product.product_description ;;
  }
  dimension: product_class {
    group_label: "Product"
    sql: ${TABLE}.product.product_class ;;
  }
  dimension: limit_type {
    group_label: "Product"
    sql: ${TABLE}.product.limit_type ;;
  }
  dimension: rate_type {
    group_label: "Product"
    sql: ${TABLE}.product.rate_type ;;
  }
  dimension: grouping {
    group_label: "Product"
    sql: ${TABLE}.product.grouping ;;
  }
  dimension: group_name {
    group_label: "Product"
    sql: ${TABLE}.product.group_name ;;
  }
  dimension: active_flag {
    group_label: "Product"
    sql: ${TABLE}.product.active_flag ;;
  }
  dimension: reporting_group {
    group_label: "Product"
    sql: ${TABLE}.product.reporting_group ;;
  }
  dimension: offset {
    group_label: "Product"
    sql: ${TABLE}.product.offset ;;
  }
  dimension: a_c {
    group_label: "Product"
    sql: ${TABLE}.product.a_c ;;
  }
  dimension: category {
    group_label: "Product"
    sql: ${TABLE}.product.category ;;
  }

########################PLANNING#################
  dimension: forecast_balance {
    group_label: "Planning"
    sql: ${TABLE}.planning.forecast_balance ;;
  }
  dimension: budget {
    group_label: "Planning"
    sql: ${TABLE}.planning.budget ;;
  }
  dimension: ip_charge_actual {
    group_label: "Planning"
    sql: ${TABLE}.planning.ip_charge_actual ;;
  }
  dimension: cp_charge_actual {
    group_label: "Planning"
    sql: ${TABLE}.planning.cp_charge_actuale ;;
  }
  dimension: GLA {
    group_label: "Planning"
    sql: ${TABLE}.planning.GLA ;;
  }
}
