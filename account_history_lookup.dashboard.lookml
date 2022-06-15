- dashboard: 2_account_history_lookup
  title: 2) Account History Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: i7bRWRvjMGfFcBdtuKDvP8
  elements:
  - name: Account History Lookup
    title: Account History Lookup
    model: reg_reporting
    explore: account
    type: looker_grid
    fields: [account.reporting_day_date, account.product_code, account.product_description,
      account.account_number, account.account_balance, account.is_delinquent]
    sorts: [account.account_balance desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
      Account Number: account.account_number
    row: 4
    col: 0
    width: 24
    height: 6
  - title: Current Balance
    name: Current Balance
    model: reg_reporting
    explore: account
    type: single_value
    fields: [account.reporting_day_date, account.account_balance]
    filters: {}
    sorts: [account.reporting_day_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${account.account_balance}\
          \ / max(${account.account_balance})) - 1.0", label: vs Peak Balance, value_format: !!null '',
        value_format_name: percent_1, _kind_hint: dimension, table_calculation: vs_peak_balance,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [account.reporting_day_date]
    series_types: {}
    listen:
      Account Number: account.account_number
    row: 0
    col: 0
    width: 8
    height: 4
  - title: Total Balance Over Time
    name: Total Balance Over Time
    model: reg_reporting
    explore: account
    type: looker_area
    fields: [account.reporting_day_date, account.total_account_balance]
    filters: {}
    sorts: [account.reporting_day_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: account.total_account_balance,
            id: account.total_account_balance, name: Total Account Balance}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      account.total_account_balance:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_fields:
    ordering: none
    show_null_labels: false
    hide_totals: false
    hide_row_totals: false
    listen:
      Account Number: account.account_number
    row: 0
    col: 8
    width: 16
    height: 4
  filters:
  - name: Account Number
    title: Account Number
    type: field_filter
    default_value: '00095a570fe97a601884203f5ff29740'
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: reg_reporting
    explore: account
    listens_to_filters: []
    field: account.account_number
