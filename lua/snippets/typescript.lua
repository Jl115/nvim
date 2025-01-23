local ls = require("luasnip") -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
  -- Print to server console
  s("logS", {
    t("console.log('\\x1b[33m%s\\x1b[0m', '"),
    i(1, "Message"),
    t(" --------------------', "),
    i(1),
    t(");"),
  }),

  -- TODO comment
  s("todo", {
    t("// TODO "),
    i(1, "Task"),
  }),

  -- Promise Without Catch
  s("promise", {
    t({
      "await new Promise((resolve) => {",
      "\tlet promiseCount = 0;",
      "\t",
    }),
    i(1, "items"),
    t({ ".forEach((" }),
    i(2, "item"),
    t({ ") => {", "\t\t" }),
    i(3, "// Code"),
    t({
      "",
      "\t\tpromiseCount++;",
      "\t\tif (promiseCount == ",
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

  -- Two nested Promises
  s("promises", {
    t({
      "await new Promise((resolve) => {",
      "\tlet promiseCount = 0;",
      "\t",
    }),
    i(1, "items"),
    t({ ".forEach((" }),
    i(2, "item"),
    t({
      ") => {",
      "\tawait new Promise((secondResolve) => {",
      "\t\tlet secondPromiseCount = 0;",
      "\t\t",
    }),
    i(3, "subItems"),
    t({ ".forEach((" }),
    i(4, "subItem"),
    t({ ") => {", "\t\t\t" }),
    i(5, "// Code"),
    t({
      "",
      "\t\t\tsecondPromiseCount++;",
      "\t\t\tif (secondPromiseCount == ",
    }),
    i(3),
    t({
      ".length) {",
      "\t\t\t\tsecondResolve();",
      "\t\t\t}",
      "\t\t});",
      "\t});",
      "\t\tpromiseCount++;",
      "\t\tif (promiseCount == ",
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

  -- Sort array of objects
  s("sortArrayOfObjects", {
    t(".sort((a, b) => (a.order > b.order ? 1 : -1));"),
  }),

  -- forEach loop
  s("each", {
    t(".forEach("),
    i(1, "item"),
    t({ " => {", "\t" }),
    i(2, "// Code"),
    t({ "", "})" }),
  }),

  -- Unbind JSON value
  s("unbind", {
    t("JSON.parse(JSON.stringify("),
    i(1, "value"),
    t("))"),
  }),

  -- Vue 3 Setup
  s("setupVue3", {
    t({
      "<template>",
      '<div class="h-screen w-screen pt-5 mainContainer">',
      '<div class="mobile-container">',
      "</div>",
      "</div>",
      "</template>",
      "<script>",
      " //* VUE",
      "import {ref} from 'vue';",
      "",
      " //* COMPOSABLES",
      "import getVariables from '@/composables/mainVariables';",
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
      "export default {",
      "setup() {",
      " //* LOAD INITIAL",
      " const {} = getVariables() ",
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
      " //* RETURN",
      " return {",
      " //* VARIABLES",
      "",
      " //* COMPUTED",
      "",
      " //* METHODS",
      "",
      "  };",
      " }",
      "};",
      "</script>",
      "<style lang='scss' scoped>",
      "</style>",
    }),
  }),

  -- Sleep function
  s("sleep", {
    t("await new Promise((resolve) => setTimeout(resolve, "),
    i(1, "1000"),
    t("));"),
  }),
})
