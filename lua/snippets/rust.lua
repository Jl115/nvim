local ls = require("luasnip") -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("rust", {
  -- Define a struct with an implementation block
  s("rcs", {
    t({ "pub struct " }),
    i(1, "MyStruct"),
    t({ " {", "\t" }),
    i(2, "field"),
    t({ ": " }),
    i(3, "Type"),
    t({ ",", "}", "\n\n" }),
    t({ "impl " }),
    i(1),
    t({ " {", "\tpub fn new(" }),
    i(2),
    t({ ": " }),
    i(3),
    t({ ") -> Self {", "\t\tSelf { " }),
    i(2),
    t({ " }", "\t}", "\n\n", "\tpub fn run(&self) {", "\t\t// " }),
    i(0),
    t({ "", "\t}", "}" }),
  }),

  -- Define an enum with variants
  s("renum", {
    t({ "pub enum " }),
    i(1, "MyEnum"),
    t({ " {", "\t" }),
    i(2, "Variant1"),
    t({ ",", "\t" }),
    i(3, "Variant2"),
    t({ ",", "}", "\n\n" }),
    t({ "impl " }),
    i(1),
    t({ " {", "\tpub fn run(&self) {", "\t\tmatch self {", "\t\t\tSelf::" }),
    i(2),
    t({ ' => println!("' }),
    i(2),
    t({ ' variant"),', "\t\t\tSelf::" }),
    i(3),
    t({ ' => println!("' }),
    i(3),
    t({ ' variant"),', "\t\t\t_ => {},", "\t\t}", "\t}", "}" }),
  }),

  -- Define a trait with a method
  s("rtrait", {
    t({ "pub trait " }),
    i(1, "MyTrait"),
    t({ " {", "\tfn " }),
    i(2, "method"),
    t({ "(&self);", "}", "\n\n" }),
    t({ "impl " }),
    i(1),
    t({ " for " }),
    i(3, "StructName"),
    t({ " {", "\tfn " }),
    i(2),
    t({ "(&self) {", "\t\t// " }),
    i(0),
    t({ "", "\t}", "}" }),
  }),

  -- Create a test function
  s("rtest", {
    t({ "#[cfg(test)]", "mod tests {", "\tuse super::*;", "\n", "\t#[test]", "\tfn " }),
    i(1, "test_function"),
    t({ "() {", "\t\tassert_eq!(" }),
    i(2, "expected"),
    t({ ", " }),
    i(3, "actual"),
    t({ ");", "\t}", "}" }),
  }),

  -- Define a basic main function
  s("rmain", {
    t({ "fn main() {", "\t" }),
    i(1, "// Your code here"),
    t({ "", "}" }),
  }),
})
