connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
label: "Capital Markets Risk Reporting"

### EXPLORES ###

explore: account {}

### DATAGROUPS ###

datagroup: daily_policy {
  sql_trigger: select current_date ;;
  max_cache_age: "24 hours"
}

persist_with: daily_policy

### ARCHIVE ###

# explore: account {
#   label: "(1) Accounts, Loans and Cards"
#   join: district {
#     relationship: many_to_one
#     sql_on: ${account.district_id} = ${district.district_id} ;;
#   }
#   join: loan {
#     relationship: one_to_many
#     sql_on: ${account.account_id} = ${loan.account_id} ;;
#   }
#   join: disp {
#     relationship: one_to_many
#     sql_on: ${account.account_id} = ${disp.account_id} ;;
#   }
#   join: card {
#     type: full_outer
#     relationship: one_to_one
#     sql_on: ${disp.disp_id} = ${card.disp_id} ;;
#   }
#   join: client {
#     relationship: one_to_one
#     sql_on: ${disp.client_id} = ${client.client_id} ;;
#   }
#   join: client_fact {
#     view_label: "Client"
#     fields: [client_fact.number_of_credit_cards]
#     relationship: one_to_one
#     sql_on: ${client.client_id} = ${client_fact.client_id} ;;
#   }
# }
