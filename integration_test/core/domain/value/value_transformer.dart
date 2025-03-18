String getZephyrStatus(String value) {
  switch (value) {
    case 'success':
    case 'skipped':
      return 'pass';
    default:
      return 'fail';
  }
}
