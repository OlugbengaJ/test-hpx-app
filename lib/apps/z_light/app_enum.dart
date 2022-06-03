/// [WorkspaceView] indicates the view that's activated.
enum WorkspaceView {
  /// [workspace] view is active
  workspace,

  /// [lighting] view is active
  lighting,
}

/// [WorkspaceDragMode] indicates the mode of selection
enum WorkspaceDragMode {
  /// [click] to select a widget
  click,

  /// [resizable] handles to select an area
  resizable,

  /// [highlight] highlight to select an area
  highlight,
}
