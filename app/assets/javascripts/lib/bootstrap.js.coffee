jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $(".annon_tooltip").on('change', -> this.tooltip() )
  $("a[rel=tooltip]").tooltip()