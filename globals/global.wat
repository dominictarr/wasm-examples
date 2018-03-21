
;; you can set a module name, but not sure were you can see it from?
(module $globals_demo


  ;; a mutable global is like this
  (global $deadbeef (mut i32) (i32.const 0xdeadbeef))
  ;; mutable globals cannot be exported, which is a shame
  ;; because it means we cannot make it stateless
  ;; but I guess we could use an initialization function.

  ;; but globals are immutable by default
  (global $DEAFBEEF (export "deadbeef") i32 (i32.const 0xdeadbeef))

  ;; to use a data section, you first must have memory
  (memory $memory 1)
  ;;data is strings (which are just concatenated)
  ;;initialized into memory at offset.

  (data (i32.const 16) ;; offset the following string by 16 bytes
    "\de\ad\be\ef"
    "test module by dominic tarr,\n"
    "demonstrates how to use globals and data\n"
    "I am assuming that multiple strings are simply appended\n"
    "etc... yup this works"
  )

  ;;to access data, must export the memory.
  ;;you can both import and export memory
  ;;but I'm not sure which is better.

  (export "memory" (memory $memory))
)


