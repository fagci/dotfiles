local augend = require("dial.augend")
require("dial.config").augends:register_group {
    default = {
        augend.constant.new {
            elements = { "and", "or" },
        },
        augend.constant.new {
            elements = { "&&", "||" },
        },
        augend.hexcolor.new {},
        augend.semver.alias.semver,
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%d-%m-%Y"],
    },
}
