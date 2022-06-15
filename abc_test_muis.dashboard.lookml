- dashboard: 1_capital_markets__risk_summary
  title: 2) Test Muis
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  preferred_slug: Spj4BgNPBRQb1Ic2ZxF31Z
  elements:
  - title: Max % Delinquent
    name: Max % Delinquent
    model: reg_reporting
    explore: account
    type: single_value
    fields: [account.total_account_balance, account.delinquent_90, account.count,
      account.reporting_day_date]
    sorts: [account.reporting_day_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${account.delinquent_90}\
          \ / ${account.count}", label: "% delinquent", value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: delinquent, _type_hint: number}, {
        category: table_calculation, expression: 'max(${delinquent})', label: max
          delinquent, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: max_delinquent, _type_hint: number}, {category: table_calculation,
        expression: 'min(${delinquent})', label: min delinquency, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: min_delinquency,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.2, background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: delinquent, id: delinquent,
            name: "% delinquent"}, {axisId: max_delinquent, id: max_delinquent, name: max
              delinquent}, {axisId: min_delinquency, id: min_delinquency, name: min
              delinquency}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: account.total_account_balance, id: account.total_account_balance,
            name: Total Account Balance}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      account.total_account_balance: "#5F6368"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [account.count, account.delinquent_90, account.total_account_balance,
      account.reporting_day_date, delinquent, min_delinquency]
    listen:
      Reporting Day Date: account.reporting_day_date
      Delinquency Threshold: account.delinquency_threshold
      Product: account.product_description
      Property State: account.property_state
    row: 0
    col: 19
    width: 5
    height: 2
  - title: Min % Delinquent
    name: Min % Delinquent
    model: reg_reporting
    explore: account
    type: single_value
    fields: [account.total_account_balance, account.delinquent_90, account.count,
      account.reporting_day_date]
    sorts: [account.reporting_day_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${account.delinquent_90}\
          \ / ${account.count}", label: "% delinquent", value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: delinquent, _type_hint: number}, {
        category: table_calculation, expression: 'max(${delinquent})', label: max
          delinquent, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: max_delinquent, _type_hint: number}, {category: table_calculation,
        expression: 'min(${delinquent})', label: min delinquency, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, table_calculation: min_delinquency,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.38, background_color: "#DADCE0",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: delinquent, id: delinquent,
            name: "% delinquent"}, {axisId: max_delinquent, id: max_delinquent, name: max
              delinquent}, {axisId: min_delinquency, id: min_delinquency, name: min
              delinquency}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: account.total_account_balance, id: account.total_account_balance,
            name: Total Account Balance}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      account.total_account_balance: "#5F6368"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [account.count, account.delinquent_90, account.total_account_balance,
      account.reporting_day_date, delinquent, max_delinquent]
    listen:
      Reporting Day Date: account.reporting_day_date
      Delinquency Threshold: account.delinquency_threshold
      Product: account.product_description
      Property State: account.property_state
    row: 0
    col: 14
    width: 5
    height: 2
  - title: FUM by Account Type
    name: FUM by Account Type
    model: reg_reporting
    explore: account
    type: looker_pie
    fields: [account.total_account_balance, account.product_description]
    filters: {}
    sorts: [account.product_description]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 30
    series_colors:
      Owner Occupied: "#34A853"
      Investment Loan: "#4285F4"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Reporting Day Date: account.reporting_day_date
      Delinquency Threshold: account.delinquency_threshold
      Product: account.product_description
      Property State: account.property_state
    row: 2
    col: 16
    width: 8
    height: 8
  - title: Delinquency Rate by Product
    name: Delinquency Rate by Product
    model: reg_reporting
    explore: account
    type: looker_line
    fields: [account.reporting_day_date, account.dynamic_delinquency_rate, account.product_description]
    pivots: [account.product_description]
    filters: {}
    sorts: [account.reporting_day_date desc, account.product_description]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: account.total_account_balance,
            id: Investment Loan - account.total_account_balance, name: Investment
              Loan - Account Total Account Balance}, {axisId: account.total_account_balance,
            id: Owner Occupied - account.total_account_balance, name: Owner Occupied
              - Account Total Account Balance}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: account.dynamic_delinquency_rate,
            id: Investment Loan - account.dynamic_delinquency_rate, name: Investment
              Loan - Account Dynamic Delinquency Rate}, {axisId: account.dynamic_delinquency_rate,
            id: Owner Occupied - account.dynamic_delinquency_rate, name: Owner Occupied
              - Account Dynamic Delinquency Rate}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      Owner Occupied - account.total_account_balance: column
      Investment Loan - account.total_account_balance: column
    series_colors:
      Investment Loan - account.dynamic_delinquency_rate: "#4285F4"
      Investment Loan - account.total_account_balance: "#DADCE0"
      Owner Occupied - account.total_account_balance: "#5F6368"
    defaults_version: 1
    listen:
      Reporting Day Date: account.reporting_day_date
      Delinquency Threshold: account.delinquency_threshold
      Product: account.product_description
      Property State: account.property_state
    row: 2
    col: 0
    width: 16
    height: 8
  - title: Total Delinquencies
    name: Total Delinquencies
    model: reg_reporting
    explore: account
    type: single_value
    fields: [account.dynamic_delinquent_total, account.reporting_day_date]
    sorts: [account.reporting_day_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [account.dynamic_delinquent_total], calculation_type: percent_of_previous,
        category: table_calculation, based_on: account.dynamic_delinquent_total, label: Percent
          of previous - Account Total Delinquencies, source_field: account.dynamic_delinquent_total,
        table_calculation: percent_of_previous_account_total_delinquencies, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [percent_of_previous_account_total_delinquencies], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: percent_of_previous_account_total_delinquencies,
        label: Percent change from previous -  Percent of previous - Account Total
          Delinquencies, source_field: percent_of_previous_account_total_delinquencies,
        table_calculation: percent_change_from_previous_percent_of_previous_account_total_delinquencies,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: "(${account.dynamic_delinquent_total}\
          \ / offset(${account.dynamic_delinquent_total}, 2) -1)", label: From LY,
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: from_ly, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [account.reporting_day_date]
    listen:
      Product: account.product_description
      Property State: account.property_state
    row: 0
    col: 0
    width: 7
    height: 2
  - title: Total FUM
    name: Total FUM
    model: reg_reporting
    explore: account
    type: single_value
    fields: [account.total_account_balance, account.reporting_day_date]
    sorts: [account.reporting_day_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [account.dynamic_delinquent_total], calculation_type: percent_of_previous,
        category: table_calculation, based_on: account.dynamic_delinquent_total, label: Percent
          of previous - Account Total Delinquencies, source_field: account.dynamic_delinquent_total,
        table_calculation: percent_of_previous_account_total_delinquencies, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [percent_of_previous_account_total_delinquencies], calculation_type: percent_difference_from_previous,
        category: table_calculation, based_on: percent_of_previous_account_total_delinquencies,
        label: Percent change from previous -  Percent of previous - Account Total
          Delinquencies, source_field: percent_of_previous_account_total_delinquencies,
        table_calculation: percent_change_from_previous_percent_of_previous_account_total_delinquencies,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: "(${account.dynamic_delinquent_total}\
          \ / offset(${account.dynamic_delinquent_total}, 2) -1)", label: Change From
          Same Period LY, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: change_from_same_period_ly, _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Product: account.product_description
      Property State: account.property_state
    row: 0
    col: 7
    width: 7
    height: 2
  filters:
  - name: Product
    title: Product
    type: field_filter
    default_value: Auto loan,Mortgage loan,Student loan
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - Auto loan
      - Mortgage loan
      - Student loan
    model: reg_reporting
    explore: account
    listens_to_filters: []
    field: account.product_description
  - name: Delinquency Threshold
    title: Delinquency Threshold
    type: field_filter
    default_value: '90'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: popover
      options: []
    model: reg_reporting
    explore: account
    listens_to_filters: []
    field: account.delinquency_threshold
  - name: Property State
    title: Property State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: reg_reporting
    explore: account
    listens_to_filters: []
    field: account.property_state
  - name: Reporting Day Date
    title: Reporting Day Date
    type: field_filter
    default_value: 5 year
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: reg_reporting
    explore: account
    listens_to_filters: []
    field: account.reporting_day_date
