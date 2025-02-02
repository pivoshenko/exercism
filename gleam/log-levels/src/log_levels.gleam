import gleam/string

pub fn message(log_line: String) -> String {
  let message: String = case log_line {
    "[INFO]: " <> rest -> rest
    "[WARNING]: " <> rest -> rest
    "[ERROR]: " <> rest -> rest
    _ -> ""
  }

  string.trim(message)
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> _rest -> "info"
    "[WARNING]: " <> _rest -> "warning"
    "[ERROR]: " <> _rest -> "error"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  let level = log_level(log_line)
  let msg = message(log_line)
  case level {
    "" -> ""
    _ -> msg <> " (" <> level <> ")"
  }
}
