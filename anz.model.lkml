connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

### EXPLORES ###

explore: account {}

### DATAGROUPS ###


### DATA TESTS ###

### ARCHIVE ###

# explore: account_facts {}
# datagroup: daily {
#   sql_trigger: select current_date ;;
#   max_cache_age: "24 hours"
# }
