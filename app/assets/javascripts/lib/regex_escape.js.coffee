RegExp.escape = (string) =>
    return string.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')
