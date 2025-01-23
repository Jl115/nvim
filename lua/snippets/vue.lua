local ls = require("luasnip") -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
    -- Print to server console
    s("logS", {
        t("console.log('\\x1b[33m%s\\x1b[0m', '"), i(1, "Message"), t(" --------------------', "), i(1), t(");"),
    }),

    -- TODO comment
    s("todo", {
        t("/* <!-- TODO: "), i(1, "Task"), t(" --> */"),
    }),

    -- Promise Without Catch
    s("promise", {
        t({
            "await new Promise((resolve) => {",
            "\tlet promiseCount = 0;",
            "\t"
        }),
        i(1, "items"),
        t({".forEach(("}),
        i(2, "item"),
        t({") => {",
            "\t\t"
        }),
        i(3, "// Code"),
        t({
            "",
            "\t\tpromiseCount++;",
            "\t\tif (promiseCount == "
        }),
        i(1),
        t({
            ".length) {",
            "\t\t\tresolve();",
            "\t\t}",
            "\t});",
            "});",
        }),
    }),

    -- Promise with try/catch
    s("promise", {
        t({
            "return new Promise((resolve, reject) => {",
            "try {",
            "if (!"
        }),
        i(1, "items"),
        t({".length > 0) {",
            "resolve();",
            "}",
            "\tlet promiseCount = 0;",
            "\t"
        }),
        i(1),
        t({".forEach(("}),
        i(2, "item"),
        t({") => {",
            "\t\t"
        }),
        i(3, "// Code"),
        t({
            "",
            "\t\tpromiseCount++;",
            "\t\tif (promiseCount == "
        }),
        i(1),
        t({
            ".length) {",
            "\t\t\tresolve();",
            "\t\t}",
            "\t});",
            "} catch (error) {",
            "reject(new Error(`[Error] in $TM_FILENAME_BASE "
        }),
        i(4, "FunctionName"),
        t({": \\${error}`));",
            "}",
            "});",
        }),
    }),

    -- Sort array of objects
    s("sortArrayOfObjects", {
        t(".sort((a, b) => (a.order > b.order ? 1 : -1));"),
    }),

    -- forEach loop
    s("each", {
        t(".forEach("), i(1, "item"), t({" => {", "\t"}), i(2, "// Code"), t({"", "})"}),
    }),

    -- Unbind JSON value
    s("unbind", {
        t("JSON.parse(JSON.stringify("), i(1, "value"), t("))"),
    }),

    -- Sleep function
    s("sleep", {
        t("await new Promise((resolve) => setTimeout(resolve, "), i(1, "1000"), t("));"),
    }),

    -- Migration handling
    s("migration", {
        t({
            "if (process.env.NODE_ENV === 'local' || process.env.NODE_ENV === 'development') {",
            "return;",
            "}",
            "const transaction = await queryInterface.sequelize.transaction();",
            "try {",
            "  return transaction.commit();",
            "} catch (error) {",
            "  await transaction.rollback();",
            "  throw error;",
            "}",
        }),
    }),

    -- Vue 3 Setup
    s("setup", {
        t({
            "<template>",
            "<div>",
            "</div>",
            "</template>",
            "<script setup>",
            " //* VUE",
            "/* import {ref} from 'vue'; */",
            "",
            " //* COMPOSABLES",
            "/* import { getVariables } from '@/composables/mainVariables'; */",
            "",
            " //* GRAPHQL",
            "",
            " //* VUELIDATE",
            "",
            " //* CUSTOM",
            "",
            " //* COMPONENTS",
            "",
            " //* CONTROLLERS",
            "",
            " //* LOAD INITIAL",
            " /* const {} = getVariables() */ ",
            "",
            " //* VARIABLES",
            "",
            " //* QUERYS",
            "",
            " //* COMPUTED",
            "",
            " //* METHODS",
            "",
            " //* MOUNTED",
            "",
            " //* CREATED",
            "",
            "</script>",
            "<style lang='scss' scoped>",
            "@import '@/assets/styles/views/$TM_FILENAME_BASE.scss';",
            "</style>",
        }),
    }),

    -- Console error logging
    s("error", {
        t("console.error('[Error] in "), i(1, "FunctionName"), t(": ', error);"),
    }),

    -- Try-catch block
    s("try", {
        t({"try {", "\t"}), i(1, "// Code"), t({"", "} catch(error) {", "console.error('[Error] in $TM_FILENAME_BASE "), i(2, "FunctionName"), t({": ', error);", "}"}),
    }),

    -- Function with try/catch
    s("function", {
        t("const "), i(1, "myFunction"), t({" = () => {", "try {", "\t"}), i(2, "// Code"), t({"", "} catch(error) {", "console.error('[Error] in $TM_FILENAME_BASE "), i(1), t({": ', error);", "}", "}"}),
    }),

    -- Headers Sent Check
    s("hS", {
        t("if (res?.headersSent) return;"),
    }),
})

