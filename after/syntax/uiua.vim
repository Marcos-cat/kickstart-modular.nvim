setlocal commentstring=#%s

hi link @lsp.type.noadic_function.uiua UiuaNoadicFunction
hi link @lsp.type.monadic_function.uiua UiuaMonadicFunction
hi link @lsp.type.dyadic_function.uiua UiuaDyadicFunction
hi link @lsp.type.triadic_function.uiua UiuaTriadicFunction
hi link @lsp.type.tetradic_function.uiua UiuaTetradicFunction
hi link @lsp.type.uiua_number.uiua Number
hi link @lsp.type.monadic_modifier.uiua UiuaMonadicModifier
hi link @lsp.type.dyadic_modifier.uiua UiuaDyadicModifier
hi link @lsp.type.triadic_modifier.uiua UiuaTriadicModifier
hi link @lsp.type.uiua_string.uiua UiuaString
hi link @lsp.type.uiua_module.uiua UiuaModule

syn match uiuaPunct '[←↚≁~_()\[\]{}|^.‥]'
hi link uiuaPunct @punctuation
