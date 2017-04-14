## 0.4.1

- Support rails-api

## 0.4.0

- Support Rails 5

## 0.3.0

- Remove Rails 3 support

## 0.2.3

- Change execution context of validator block
- Fix a development dependencies problem

## 0.2.2

- Fix nil validation bug on nested parameters (Thx @mzp)

## 0.2.1

- Fix validtion bug on existence check

## 0.2.0

- Add strong options on validator DSL (Thx @yoshiori)

## 0.1.7

- Fix bug on missing `@path` variable (Thx @taka0125)

## 0.1.6

- Support nested parameters (Thx @mzp)

## 0.1.5

- Support `file` validator (#6)

## 0.1.4

- Tiny improvement about Validator#params

## 0.1.3

- Don't directly touch AC::Base, but do it via AS.on_load

## 0.1.2

- Add `:handler` option to customize failure behavior
- Fix bug around `float` validator with block

## 0.1.1

- Add `any` validator

## 0.1.0

- Add type checking to `string` validator

## 0.0.9

- Improve error message

## 0.0.8

- Add block support to all validators
- Add `float` validator

## 0.0.7

- Fix `integer` validator bug

## 0.0.6

- Change value handling in `:only` & `:except` checking

## 0.0.5

- Add `:only` & `:except` options

## 0.0.4

- Fix stored controller name for namespaced controller

## 0.0.3

- Fix type name bug

## 0.0.2

- Add `hash` & `boolean` validator

## 0.0.1

- Release the first version on 2013-06-07
