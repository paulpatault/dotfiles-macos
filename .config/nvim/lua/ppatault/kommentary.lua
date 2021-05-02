local kommentary_conf = require('kommentary.config')

kommentary_conf.configure_language("why3", {
    prefer_multi_line_comments = true,
    multi_line_comment_strings = {"(*", "*)"},
})

kommentary_conf.configure_language("default", {
    use_consistent_indentation = true,
    ignore_whitespace = true,
})
